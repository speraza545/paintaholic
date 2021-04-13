class JobController < ApplicationController
    get "/jobs" do
        if logged_in?
            @user = current_user
            erb :"/job/index"
        else 
            redirect "/login"
        end
    end

    get "/jobs/new" do
        if logged_in?
            @user = current_user
            erb :"job/create_job"
        else 
            redirect "/login"
        end
    end

    post "/jobs" do 
        if params[:behr_premium] == nil
            premium_paint = false
        else
            premium_paint = params[:behr_premium]
        end
        job = current_user.jobs.build(name: params[:name], email: params[:email], phone_number: params[:phone_number], address: params[:address], behr_premium: premium_paint, date: params[:date], time: params[:time])
        if job.save 
            redirect "jobs/#{job.id}/rooms"
        else
            redirect "/job/new"
        end
    end

    get "/jobs/:id" do
        if logged_in?
        @job = Job.find(params[:id])
        @user = User.find(@job.user_id)
        erb :"/job/show"
        else 
            redirect "/signup"
        end
    end 

    get "/jobs/:id/edit" do 
        @job = Job.find(params[:id])
        if logged_in? && @job.user_id == current_user.id
            @user = User.find(@job.user_id)
            erb :"/job/edit"
        else
            redirect "/login"
        end
    end

    patch "/jobs/:id" do
        if params[:behr_premium] == nil
            premium_paint = false
        else
            premium_paint = params[:behr_premium]
        end
        @job = Job.find(params[:id])
        if logged_in? && @job.user_id == current_user.id
        @job.update(name: params[:name], email: params[:email], phone_number: params[:phone_number], address: params[:address], behr_premium: premium_paint, date: params[:date], time: params[:time])
        redirect "/jobs/#{params[:id]}"
        else 
            redirect "/login"
        end
    end

    delete "/jobs/:id/delete" do
    job = Job.find(params[:id])
    rooms = Room.where(job_id: job.id)
    if logged_in? && job.user_id == current_user.id
        if rooms != nil
            rooms.each do |room|
                room.delete
            end
            job.delete 
            redirect "/jobs"
        else 
            job.delete 
            redirect "/jobs"
        end
    else
        redirect "/login"
    end
    end


end
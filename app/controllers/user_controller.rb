class UserController < ApplicationController
    get "/signup" do 
        erb :"/user/create_user"
    end

    post "/signup" do 
        if !!User.find_by(email: params[:email])
            redirect "/signup"
        else
            user = User.new(params)
            if user.save
                session[:user_id] = user.id
                redirect "/jobs"
            else
                redirect "/signup"
            end
        end
    end

    get "/login" do
        if !logged_in?
            erb :'user/login'
        else
            redirect '/jobs'
        end
    end

    post "/login" do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect "/jobs"
        else 
            redirect "/signup"
        end
    end

    get '/logout' do
        if logged_in?
          session.destroy
          redirect to '/login'
        else
          redirect to '/'
        end
      end
    get "/user/:id" do
      @user = User.find(params[:id])
      if logged_in? && @user.id == current_user.id
      erb :'user/show'
      else
        redirect "/login"
      end
    end

    get '/user/:id/edit' do
        @user = User.find(params[:id])
        if logged_in?
        erb :"/user/edit"
        else 
            redirect "/login"
        end
    end

    patch '/user/:id' do
        @user = User.find(params[:id])
        if !!User.find_by(email: params[:email]) && @user != User.find_by(email: params[:email])
            redirect "/user/#{@user.id}/edit"
        else
            if logged_in? && @user.id = current_user.id
                @user.update(name: params[:name], email: params[:email], phone_number: params[:phone_number], address: params[:address])
                redirect "/user/#{@user.id}"
            else
                redirect "/login"
            end
        end
    end

    delete "/user/:id/delete" do
            user = User.find(params[:id])
            jobs = Job.where(user_id: user.id)
            if logged_in? && user.id == current_user.id
                if jobs !=nil
                    jobs.each do |job|
                        if job.rooms != nil
                            job.rooms.each do |room|
                                room.delete
                            end
                            job.delete
                        else
                            job.delete 
                        end
                    end
                    user.delete
                    session.destroy
                    redirect "/"
                else
                    user.delete
                    session.destroy
                    redirect "/"
                end
            else
                redirect "/login"
            end
        end

end
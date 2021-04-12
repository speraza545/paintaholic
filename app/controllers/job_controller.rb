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
        erb :"job/create_job"
    end
end
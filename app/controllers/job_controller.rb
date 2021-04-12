class JobController < ApplicationController
    get "/jobs" do
        if logged_in?
            @user = current_user
            erb :"/job/index"
        else 
            redirect "/login"
        end
    end
end
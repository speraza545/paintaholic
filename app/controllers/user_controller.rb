class UserController < ApplicationController
    get "/signup" do 
        erb :"/user/create_user"
    end

    post "/signup" do 
        user = User.new(name: params[:name], email: params[:email], phone_number: params[:phone_number], address: params[:address], password_digest: params[:password_digest])
        user.save
        if user.save
            session[:user_id] = user.id
            redirect "/jobs"
        else
            redirect "/signup"
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
        binding.pry
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password_digest])
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

end
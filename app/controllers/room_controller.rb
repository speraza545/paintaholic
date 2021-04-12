class RoomController < ApplicationController

    get "/jobs/:id/rooms" do
        if logged_in?
            @job = Job.find(params[:id])
            erb :"room/create_room"
        else 
            redirect "/login"
        end
    end

    post "/jobs/:id/rooms" do
        room = Room.new(length: params[:length], width: params[:width], height: params[:height], job_id: params[:job_id])
        room.save 
        redirect "/jobs/#{params[:job_id]}/rooms"
    end

    get "/jobs/:id/rooms/:room_id/edit" do
        if logged_in?
        @room = Room.find(params[:room_id])
        @job = Job.find(params[:id])
        erb :"/room/edit"
        else 
            redirect "/login"
        end
    end

    patch "/jobs/:id/rooms/:room_id" do 
        room = Room.find(params[:room_id])
        room.update(length: params[:length], width: params[:width], height: params[:height])
        redirect "/jobs/#{params[:id]}"
    end

end
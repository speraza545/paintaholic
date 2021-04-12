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
        room = Room.new(length: params[:length], width: params[:width], height: [:height], job_id: params[:job_id])
        room.save 
        redirect "/jobs/#{params[:job_id]}/rooms"
    end

end
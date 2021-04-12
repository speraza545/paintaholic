class Room < ActiveRecord::Base
    has_many :users, through: :jobs
end
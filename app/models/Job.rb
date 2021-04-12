class Job < ActiveRecord::Base
    has_many :rooms
    belongs_to :users
    has_many :estimates
end
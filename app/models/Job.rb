class Job < ActiveRecord::Base
    belongs_to :rooms
    belongs_to :users
    has_many :estimates
end
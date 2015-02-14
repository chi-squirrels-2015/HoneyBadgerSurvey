class Response < ActiveRecord::Base
  belongs_to :voter, class_name: "User"
  belongs_to :choice
end

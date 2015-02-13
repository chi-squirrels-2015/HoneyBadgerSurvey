class Question < ActiveRecord::Base
  belongs_to :survey

  has_many :choices
  has_many :responses, through: :choices
  has_many :voters, through: :responses #finish

end

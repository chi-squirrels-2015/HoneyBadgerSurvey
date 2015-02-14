class User < ActiveRecord::Base
  validates_uniqueness_of :username, :email, case_sensitive: false

  has_many :created_surveys, foreign_key: :creator_id

  has_many :responses, foreign_key: :voter_id
  has_many :choices, through: :responses
  has_many :questions, through: :choices
  has_many :voted_on_surveys, through: :questions, source: :survey


  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    return user if user && (user.password == password)
    nil
  end

end

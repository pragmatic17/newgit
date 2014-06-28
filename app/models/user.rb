class User < ActiveRecord::Base
  #needed to exist for login to render correctly
  #attr_accessor :username, :first_name, :last_name, :password, :password_confirmation, :walldate
  has_secure_password
  attr_accessible :username, :first_name, :last_name, :password, :password_confirmation
  has_many :posts
  has_many :friendships
  has_many :pending_friendships
  
   #validates :username, uniqueness: {message: "already taken!"}, presence: true, format: {with: /\A[a-zA-Z0-9]+\Z/, message: "must be alphanumeric and no spaces!"}
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :password, confirmation: true
  # #validates :walldate, presence: true
end

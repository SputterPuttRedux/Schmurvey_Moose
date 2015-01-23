class User < ActiveRecord::Base
  has_secure_password

  has_many :created_surveys, class_name: "Survey"
  has_many :user_answers
  has_many :answers, through: :user_answers

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true

end

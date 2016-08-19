class Movie < ActiveRecord::Base
  has_many :reviews
  
  has_secure_password
end

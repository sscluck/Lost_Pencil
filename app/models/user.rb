class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :confirm_password

  has_many :postings
end

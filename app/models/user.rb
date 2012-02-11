class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :confirm_password

  validates :name, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true
  validates :confirm_password, :presence => true

  has_many :postings

  def self.verify(email, submit_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.password == submit_password
  end

  def self.verify_for_cookie(id, pw)
    user = find_by_id(id)
    (user && user.password = pw) ? user : nil
  end

end

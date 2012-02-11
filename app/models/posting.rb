class Posting < ActiveRecord::Base
  attr_accessible :title, :description, :location, :difficulty, :found

  belongs_to :user
end

class Posting < ActiveRecord::Base
  attr_accessible :title, :description, :location, :difficulty

  belongs_to :user
end

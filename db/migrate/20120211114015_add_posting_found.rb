class AddPostingFound < ActiveRecord::Migration
  def self.up
    add_column :postings, :found, :bool
  end
end

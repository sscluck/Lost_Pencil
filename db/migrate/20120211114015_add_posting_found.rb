class AddPostingFound < ActiveRecord::Migration
  def self.up
    add_column :postings, :found, :bool
  end

  def self.down
    remove_column :postings, :found
  end
end

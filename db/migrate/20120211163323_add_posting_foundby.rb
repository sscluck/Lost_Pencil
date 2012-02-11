class AddPostingFoundby < ActiveRecord::Migration
  def self.up
    add_column :postings, :found_by, :integer
  end

  def self.down
    remove_column :postings, :found_by
  end
end

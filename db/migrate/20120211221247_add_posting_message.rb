class AddPostingMessage < ActiveRecord::Migration
  def self.up
    add_column :postings, :message, :string
  end

  def down
    remove_column :postings, :message
  end
end

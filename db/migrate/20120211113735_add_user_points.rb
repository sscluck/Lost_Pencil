class AddUserPoints < ActiveRecord::Migration
  def self.up
    add_column :users, :points, :string
  end

  def self.down
    remove_column :users, :points
  end
end

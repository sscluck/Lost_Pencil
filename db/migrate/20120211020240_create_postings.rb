class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :title
      t.string :description
      t.string :location
      t.string :difficulty
      t.string :date
      t.integer :user_id

      t.timestamps
    end
  end
end

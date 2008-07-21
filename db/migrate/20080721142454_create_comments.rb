class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :would_you_prefer_id
      t.integer :user_id
      t.string :author
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end

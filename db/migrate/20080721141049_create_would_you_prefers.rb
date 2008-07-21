class CreateWouldYouPrefers < ActiveRecord::Migration
  def self.up
    create_table :would_you_prefers do |t|
      t.string :title
      t.string :first_option
      t.string :second_option
      t.datetime :published_at, :default => nil

      t.timestamps
    end
  end

  def self.down
    drop_table :would_you_prefers
  end
end

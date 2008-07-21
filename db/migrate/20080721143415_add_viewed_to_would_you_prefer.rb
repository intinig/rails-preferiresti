class AddViewedToWouldYouPrefer < ActiveRecord::Migration
  def self.up
    add_column :would_you_prefers, :viewed, :integer, :default  => 0
  end

  def self.down
    remove_column :would_you_prefers, :viewed  
  end
end

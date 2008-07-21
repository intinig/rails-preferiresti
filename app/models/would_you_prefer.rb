class WouldYouPrefer < ActiveRecord::Base
  
  has_many :comments
  
  validates_presence_of :first_option
  validates_presence_of :second_option
  
  def view!
    self.viewed += 1
    save!
  end
end

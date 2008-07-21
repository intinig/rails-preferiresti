class Comment < ActiveRecord::Base
  
  attr_accessible :author, :body
  
  belongs_to :would_you_prefer
  belongs_to :user
  
  validates_presence_of   :body 
  validates_presence_of   :would_you_prefer_id
  validates_existence_of  :would_you_prefer 
  
  before_save :set_user

protected

  def set_user
    if UserActionObserver.current_user
      self.user = user
    end
  end
  
end

class UserActionObserver < ActiveRecord::Observer
  
  cattr_accessor :current_user
  
  observe WouldYouPrefer
    
end

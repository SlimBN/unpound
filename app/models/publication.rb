class Publication < ActiveRecord::Base
  attr_accessible :article_id, :element, :journal_id, :user_id
  
  belongs_to :user
end

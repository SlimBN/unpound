class Follow < ActiveRecord::Base
  attr_accessible :followee_id, :journal_id, :user_id

  belongs_to :user
  belongs_to :journal
  
end

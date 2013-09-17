class Follow < ActiveRecord::Base
  attr_accessible :followee_id, :journal_id, :user_id
end

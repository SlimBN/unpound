class Credit < ActiveRecord::Base
  attr_accessible :article_id, :user_id, :verdict
end

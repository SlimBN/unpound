class Notification < ActiveRecord::Base
  attr_accessible :article_id, :issue_id, :seen, :user_id
end

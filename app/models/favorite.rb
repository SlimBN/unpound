class Favorite < ActiveRecord::Base
  attr_accessible :article_id, :board_id, :journal_id, :user_id

  belongs_to :user
end

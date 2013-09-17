class ArticlesAndPage < ActiveRecord::Base
  attr_accessible :article_id, :page_id, :style, :user_id, :journal_id

  belongs_to :user
  belongs_to :page
  belongs_to :article

end

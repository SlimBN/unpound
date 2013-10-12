class ArticlesAndPage < ActiveRecord::Base
  attr_accessible :article_id, :page_id, :style, :user_id, :journal_id, :number_of_repush, :number_of_article_repush

  belongs_to :user
  belongs_to :page
  belongs_to :article

end

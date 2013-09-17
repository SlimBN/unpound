class Article < ActiveRecord::Base
  attr_accessible :content, :lang_id, :photo, :slug, :title, :user_id

  has_many :articlesandpage

  belongs_to :user
end

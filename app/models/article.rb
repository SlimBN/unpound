class Article < ActiveRecord::Base
  attr_accessible :content, :lang_id, :photo, :slug, :title, :user_id
  mount_uploader :photo, PhotoUploader

  has_many :articlesandpage

  belongs_to :user
end

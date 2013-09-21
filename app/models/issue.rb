class Issue < ActiveRecord::Base
  attr_accessible :journal_id, :number, :picture, :theme, :draft
  mount_uploader :picture, PictureUploader

  has_many :pages
  
  belongs_to :journal
end

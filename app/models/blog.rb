class Blog < ActiveRecord::Base
  attr_accessible :content, :shot, :slug, :title, :user_id
  mount_uploader :shot, ShotUploader

  belongs_to :user
end

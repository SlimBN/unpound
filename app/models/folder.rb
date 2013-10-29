class Folder < ActiveRecord::Base
  attr_accessible :description, :hidden, :kind, :name, :skin, :user_id
  mount_uploader :skin, SkinUploader
end

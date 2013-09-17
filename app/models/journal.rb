class Journal < ActiveRecord::Base
  attr_accessible :country_id, :cover, :description, :logo, :name, :slug, :user_id

  belongs_to :user
end

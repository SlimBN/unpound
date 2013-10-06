class Tag < ActiveRecord::Base
  attr_accessible :content

  has_and_belongs_to_many :articles
end

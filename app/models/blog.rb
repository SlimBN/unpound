class Blog < ActiveRecord::Base
  attr_accessible :content, :shot, :slug, :title, :user_id
  mount_uploader :shot, ShotUploader

  validates :slug, uniqueness: true, presence: true
  validates :title, presence: true

  belongs_to :user

  before_validation :generate_slug

  def to_param
  	slug
  end


  def generate_slug
  	self.slug ||= title.parameterize  	
  end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :about, :avatar, :country_id, :town, :username, :slug, :background
  attr_accessible :provider, :uid

  mount_uploader :avatar, AvatarUploader
  mount_uploader :background, BackgroundUploader

  has_many :journals
  has_many :articlesandpage
  has_many :articles
  has_many :follows
  has_many :blogs
  has_many :favorites
  has_many :publications

  validates :slug, uniqueness: true, presence: true
  validates :username, presence: true

  before_validation :generate_slug

  def to_param
    slug
  end


  def generate_slug
    self.slug ||= username.parameterize    
  end

  # def trigger_view_event
  #   FNORD_METRIC.event(attributes.merge(_type: :view_user))
  # end

end

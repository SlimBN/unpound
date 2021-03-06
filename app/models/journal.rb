class Journal < ActiveRecord::Base
  attr_accessible :country_id, :cover, :description, :logo, :name, :slug, :user_id
  mount_uploader :cover, CoverUploader

  belongs_to :user

  has_many :reads
  has_many :follows
  has_many :issues


# def trigger_view_event
#   FNORD_METRIC.event(attributes.merge(_type: :view_journal))    
# end

end

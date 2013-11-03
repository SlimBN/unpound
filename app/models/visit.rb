class Visit < ActiveRecord::Base
  attr_accessible :what, :ip_address, :user_id, :element_id
end

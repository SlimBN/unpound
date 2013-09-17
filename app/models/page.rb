class Page < ActiveRecord::Base
  attr_accessible :issue_id, :name, :classement
  
  has_many :articlesandpage

  belongs_to :issue
end

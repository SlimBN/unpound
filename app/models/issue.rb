class Issue < ActiveRecord::Base
  attr_accessible :journal_id, :number, :picture, :theme, :draft

  has_many :pages
end

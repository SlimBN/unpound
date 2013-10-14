class Read < ActiveRecord::Base
  attr_accessible :article_id, :journal_id, :user_id, :issue_id, :publication_id, :page_id

  belongs_to :journal
  belongs_to :user
  belongs_to :article
end

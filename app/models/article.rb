class Article < ActiveRecord::Base
  attr_accessible :content, :lang_id, :photo, :slug, :title, :user_id
  mount_uploader :photo, PhotoUploader

  has_many :articlesandpage

  # has_as_belongs_to_many :tags

  belongs_to :user

def trigger_view_event
  FNORD_METRIC.event(attributes.merge(_type: :view_article))    
end


#deep surgery for the hashtag thing (ba3 ba3 ba3)
  # serialize :tag_list
  # before_save :generate_taglist
  # after_commit :process_tags

  # private
  # def generate_taglist
  #   self.tag_list = self.body.scan(/#(w*[A-Za-z0-9_]+w*)/).flatten
  # end
  
  # def process_tags(post_id)
  #   p = Post.find(post_id)
  #   p.tag_list.each do |tag|
  #     t = find_or_initialize_by_content(tag)
  #     t.posts << p
  #     t.save
  #   end
  # end

end

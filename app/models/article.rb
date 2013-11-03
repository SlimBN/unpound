class Article < ActiveRecord::Base
  attr_accessible :content, :lang_id, :photo, :slug, :title, :user_id
  mount_uploader :photo, PhotoUploader

  has_many :articlesandpage
  has_many :favorites

  has_and_belongs_to_many :tags

  belongs_to :user

  validates :slug, uniqueness: true, presence: true
  validates :title, presence: true

  before_validation :generate_slug

  def to_param
    slug
  end


  def generate_slug
    self.slug ||= title.parameterize    
  end


# def trigger_view_event
#   FNORD_METRIC.event(attributes.merge(_type: :view_article))    
# end
  
  def process_tags(article_id)
    p = Article.find(article_id)
    p.tag_list.each do |tag|
      t = Tag.find_or_create_by_content(tag)
      t.articles << p
      t.save

      # p.content = p.content.gsub("#" + tag) {"<a href='" + Rails.application.routes.url_helpers.tag_path(tag) + "'>#"+tag+"</a>"}
      # p.save
    end
  end


#deep surgery for the hashtag thing (ba3 ba3 ba3)
  serialize :tag_list
  before_save :generate_taglist
  after_commit :process_tags

  private
  def generate_taglist
    self.tag_list = self.content.scan(/#(w*[A-Za-z0-9_]+w*)/).flatten
    # self.content = self.content.gsub(/#(w*[A-Za-z0-9_]+w*)/) {"<a href='#{x}'>#{x}</a>"}
    # self.content.save
  end

end

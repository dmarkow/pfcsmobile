class Contact < ActiveRecord::Base
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings
  
  default_scope where("is_active='t'").order("sort_as")
  
  def to_s
    display_as
  end
end

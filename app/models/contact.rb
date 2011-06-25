class Contact < ActiveRecord::Base
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings
  has_many :actionitems
  
  default_scope where("is_active='t'").order("sort_as")
  
  def to_s
    display_as
  end
end

class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :contacts, :through => :taggings, :source => :taggable, :source_type => "Contact"
  def self.pfcs_staff
    where("category='PFCS Staff'").first
  end
end

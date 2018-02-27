class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :reviews
  
  validates :home_type,presence:true
  validates :pet_type,presence:true
  validates :pet_size,presence:true
  validates :breeding_years,presence:true
  
  has_attached_file :image, styles: { medium: "700x500#", small: "350x250>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  
  geocoded_by :address
  after_validation :geocode,:if => :address_changed? 
end

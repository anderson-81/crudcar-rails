class Car < ActiveRecord::Base
  belongs_to :Customer

  accepts_nested_attributes_for :Customer

  #Validations:
  validates :model, presence: true
  validates :plate, presence: true
  validates :year, presence: true
  validates :marketval, presence: true
	validates :Customer_id, presence: true
	
	validates :model, length: { maximum: 100 }
	validates :plate, length: { minimum: 7 }
	validates :plate, length: { maximum: 7 }
	validates :year, length: {minimum: 4 }
	validates :year, length: {maximum: 4 }

	validates :plate, uniqueness: true
  validates :marketval, inclusion: {in: 0..9999999}

  has_one :avatar
  accepts_nested_attributes_for :avatar, allow_destroy: true

  #Avatar
  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end

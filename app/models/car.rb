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

  has_one :avatar
  accepts_nested_attributes_for :avatar, allow_destroy: true

  #Avatar
  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :plate, format: { with: /\A[A-Z]{3}\d{4}\z/i, on: :create }
  validates :year, format: { with: /\A\d{4}\z/i, on: :create }

  validates :plate, format: { with: /\A[A-Z]{3}\d{4}\z/i, on: :update }
  validates :year, format: { with: /\A\d{4}\z/i, on: :update }
end

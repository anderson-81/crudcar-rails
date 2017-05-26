class Customer < ActiveRecord::Base
	has_many :Cars

	has_one :avatar
  accepts_nested_attributes_for :avatar, allow_destroy: true

	#Avatar
	has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  #Validations:
  validates :name, presence: true
  validates :email, presence: true
  validates :salary, presence: true
  validates :birthday, presence: true
	validates :gender, presence: true

	validates :name, length: { maximum: 100 }
	validates :email, length: { maximum: 100 }
	validates :gender, length: { maximum: 1 }

	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :gender, format: { with: /\A[MF]\z/i, on: :create }

  validates :email, uniqueness: true

  #ValidatesTimeliness
  validates_date :birthday, :before => lambda { 18.years.ago }, :before_message => "Must be at least 18 years old."

  def getGender
		if self.gender == "M"
			"Male"
		else
			"Female"
		end
	end

	#Filter By Name
	def self.SearchName(query)
		@customers = Customer.where("name like ?", "#{query}%")
 	end
end

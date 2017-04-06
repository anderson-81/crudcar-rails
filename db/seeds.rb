# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


'''
10.times do |c|
	c_name = Faker::Name.name
	puts "Cadastrando #{c_name} ..."
	c_email = Faker::Internet.email
	c_birth = Faker::Date.birthday(18, 65) 
	c_sal = Faker::Number.decimal(2, 3)
	c_gender = "F"
	Customer.create(name: c_name, email: c_email, birthday: c_birth, salary: c_sal, gender: c_gender)
end
'''


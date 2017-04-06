namespace :utils do
  desc "Fill customer table."
  task fakeData: :environment do
  	if Rails.env.development? 
  		if (ARGV.size == 2) && (ENV['QTD'] != "")
	  		ENV['QTD'].to_i.times do |c|
				c_name = Faker::Name.name
				puts "Insert #{c_name} ..."
				c_email = Faker::Internet.email
				c_birth = Faker::Date.birthday(18,65) 
				c_sal = Faker::Number.decimal(2,3)
				c_gender = "F"
				Customer.create(name: c_name, email: c_email, birthday: c_birth, salary: c_sal, gender: c_gender)
			end
		else
		  puts "Empty quantity."
		  puts "Ex: rake utils:fakeData QTD=20"
		end
	else
	  puts "These is no development's environment."		
	end
  end
end

json.extract! customer, :id, :name, :email, :salary, :birthday, :gender, :created_at, :updated_at
json.url customer_url(customer, format: :json)

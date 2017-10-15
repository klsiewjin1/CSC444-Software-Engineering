json.extract! user, :id, :type, :username, :fname, :lname, :state, :streetnum, :pcode, :city, :country, :email, :cellphone, :bdate, :created_at, :updated_at
json.url user_url(user, format: :json)

# For User, role = 0 (tourist) and role = 1 (tour guide)

User.create(first_name: "Elon", last_name: "Musk", email: "elon@spacex.com", username: "elonmusk", password: "elonmusk", role: 1)
User.create(first_name: "Larry", last_name: "Page", email: "larry@google.com", username: "larrypage", password: "larrypage", role: 1)

User.create(first_name: "Richard", last_name: "Hendricks", email: "richard@piedpiper.com", username: "elonmusk", password: "richard")
User.create(first_name: "Dinesh", last_name: "Kumar", email: "dinesh@piedpiper.com", username: "dinesh", password: "dinesh")



Package.create(title: "Tour of SpaceX", destination: "An inside look of how SpaceX works!", state: "CA", country: "US", day: 1, description: "An inside look of how SpaceX works!", accommodation: true, transportation: "bus", meal: "burgers", head: 10, private_price: 1000, user_id: 1)
Package.create(title: "Tour of Tesla Motors", destination: "An inside look of how Tesla Motors works!", state: "CA", country: "US", day: 1, description: "An inside look of how Tesla Motors works!", accommodation: true, transportation: "bus", meal: "nachos", head: 10, private_price: 1000, user_id: 1)
Package.create(title: "Tour of Googleplex", destination: "A tour of Googleplex!", state: "CA", country: "US", day: 1, description: "A tour of Googleplex!", accommodation: true, transportation: "bus", meal: "chocolate pudding", head: 10, private_price: 1000, user_id: 2)



PrivateReservation.create(package_id: 1, user_id: 3, head_count: 1, start_date: "2016-10-11", end_date: "2016-10-11")
PrivateReservation.create(package_id: 2, user_id: 3, head_count: 1, start_date: "2016-10-12", end_date: "2016-10-12")

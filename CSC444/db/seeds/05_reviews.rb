# service_id not used currently, may use later to specify user ratings among services (e.g. someone could be much better at computer help than
# shovelling snow)

Review.delete_all

teens = User.where(user_type: 'teenager')
clients = User.where(user_type: 'client')

max_completed_date = Date.new(2017, 12, 3)
completed_listings = ServiceListingApproval.where(approved: true)

rating_reviews = { 1 => ['Horrible, stay far away from them!', 'They do not belong on TeenServe!', 'Never using this person again!'], 
                   2 => ['Pretty unhappy with their effort', 'Not impressed with their work', 'Did not meet my expectations'], 
                   3 => ['Not too bad', 'They did alright', 'Neutral opinion on them'], 
                   4 => ['Pretty happy with what they did', 'Quite impressed with their work', 'Did a good job'],
                   5 => ['Couldn\'t have done a better job!', 'Very highly recommend this person!', 'Very outstanding!'] }

reviews = []

completed_listings.each do |listing|
  if listing.service_listing.task_date > max_completed_date
    next # Ruby equivalent of continue
  end
  
  client_id = listing.service_listing.user_id
  teen_id = listing.teen_id
  service_id = listing.service_listing.service_id
  
  # client reviewing teen (set to happen about 75% of the time)
  if rand(4) > 0
    rating1 = [rand(5) + 1, rand(5) + 1].max # bigger of two random values, biases towards more 4 or 5 star ratings
    review1 = rating_reviews[rating1][rand(3)]
    reviews.push({ reviewer_id: client_id, reviewee_id: teen_id, service_id: service_id, rating: rating1, review: review1 })
  end
  
  # teen reviewing client (set to happen about 75% of the time)
  if rand(4) > 0
    rating2 = [rand(5) + 1, rand(5) + 1].max # bigger of two random values, biases towards more 4 or 5 star ratings
    review2 = rating_reviews[rating2][rand(3)]
    reviews.push({ reviewer_id: teen_id, reviewee_id: client_id, service_id: service_id, rating: rating2, review: review2 })
  end
end

Review.create(reviews)

# values = reviews.map{ |r| "(#{r[:reviewer_id]}, #{r[:reviewee_id]}, #rl[:service_id]}, #rl[:rating]}, #rl[:review]})" }.join(',')
# ActiveRecord::Base.connection.execute("INSERT INTO reviews (reviewer_id, reviewee_id, service_id, rating, review) VALUES #{values}")

# reviews = Review.create([{ reviewer_id: User.all.where(fname: 'AAA').first.id, reviewee_id: 1, rating: 5, review: 'his name is jeff and he was great', service_id: 1 },
#                         { reviewer_id: User.all.where(fname: 'AAA').first.id, reviewee_id: 1, rating: 5, review: 'this jeff guy is greaet', service_id: 1 },
#                         { reviewer_id: User.all.where(fname: 'AAA').first.id, reviewee_id: User.all.where(fname: 'Kanye').first.id, review: 'bro', rating: 5, service_id: 1 },
#                         { reviewer_id: User.all.where(fname: 'AAA').first.id, reviewee_id: User.all.where(fname: 'Kanye').first.id, review: 'bro', rating: 5, service_id: 1 },
#                         { reviewer_id: User.all.where(fname: 'BBB').first.id, reviewee_id: User.all.where(fname: 'Kanye').first.id, review: 'bro', rating: 5, service_id: 1 },
#                         { reviewer_id: User.all.where(fname: 'CCC').first.id, reviewee_id: User.all.where(fname: 'Kanye').first.id, review: 'bro', rating: 4, service_id: 1 },
#                         { reviewer_id: User.all.where(fname: 'AAA').first.id, reviewee_id: User.all.where(fname: 'Kendrick').first.id, review: 'bro', rating: 5, service_id: 1 },
#                         { reviewer_id: User.all.where(fname: 'BBB').first.id, reviewee_id: User.all.where(fname: 'Kendrick').first.id, review: 'bro', rating: 4, service_id: 1 }])



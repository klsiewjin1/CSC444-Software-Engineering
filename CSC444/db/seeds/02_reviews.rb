# service_id not used currently, may use later to specify user ratings among services (e.g. someone could be much better at computer help than
# shovelling snow)
Review.delete_all
reviews = Review.create([{ reviewer_id: User.all.where(fname: 'AAA').first.id, reviewee_id: 1, rating: 5, review: 'his name is jeff and he was great', service_id: 1 },
                         { reviewer_id: User.all.where(fname: 'AAA').first.id, reviewee_id: 1, rating: 5, review: 'this jeff guy is greaet', service_id: 1 },
                         { reviewer_id: User.all.where(fname: 'AAA').first.id, reviewee_id: User.all.where(fname: 'Kanye').first.id, review: 'bro', rating: 5, service_id: 1 },
                         { reviewer_id: User.all.where(fname: 'AAA').first.id, reviewee_id: User.all.where(fname: 'Kanye').first.id, review: 'bro', rating: 5, service_id: 1 },
                         { reviewer_id: User.all.where(fname: 'BBB').first.id, reviewee_id: User.all.where(fname: 'Kanye').first.id, review: 'bro', rating: 5, service_id: 1 },
                         { reviewer_id: User.all.where(fname: 'CCC').first.id, reviewee_id: User.all.where(fname: 'Kanye').first.id, review: 'bro', rating: 4, service_id: 1 },
                         { reviewer_id: User.all.where(fname: 'AAA').first.id, reviewee_id: User.all.where(fname: 'Kendrick').first.id, review: 'bro', rating: 5, service_id: 1 },
                         { reviewer_id: User.all.where(fname: 'BBB').first.id, reviewee_id: User.all.where(fname: 'Kendrick').first.id, review: 'bro', rating: 4, service_id: 1 }])
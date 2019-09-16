#this hold default seeds for the database. run rails db:seed to load seeds into database
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.delete_all
Comment.delete_all
User.delete_all

PASSWORD = "supersecret"

 super_user = User.create(
  first_name: 'Admin',
  last_name: 'User',
  email: 'Admin@seed.com',
  password: 'supersecret',
  admin: true
)

 10.times do |num|
  full_name = Faker::TvShows::SiliconValley.character.split(' ')
  first_name = full_name[0]
  last_name = full_name[1]
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}-#{num}@piedpiper.com",
    password: 'supersecret'
  )
end

users = User.all


NUM_PRODUCT = 100

NUM_PRODUCT.times do
  created_at = Faker::Date.backward(365 * 5)
  p =Post.create({
    title: Faker::Beer.name,
    body: Faker::Lorem.paragraph_by_chars(55, false),
    created_at: created_at,
    updated_at: created_at,
    user: users.sample
  })

  if p.valid?
    rand(0..10).times.each do	    
      Comment.create(	      	       
        body: Faker::TvShows::Seinfeld.quote,	       
        post: p,	       
        user: users.sample
      )	      
    end	   
  end	 
end

posts = Post.all


puts "Created #{User.count} users"

puts "Created #{Post.count} post"

puts "Created #{Comment.count} comments"

puts "Login with #{super_user.email} and password: #{PASSWORD}"
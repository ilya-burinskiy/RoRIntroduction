# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories_seeds = [
  Category.new(name: 'C++'),
  Category.new(name: 'Python'),
  Category.new(name: 'Ruby')
]

categories_seeds.each do |seed|
  Category.find_or_create_by(name: seed.name)
end

users_seeds = []
5.times do |i|
  users_seeds << User.new(first_name: "fname#{i}", 
                          last_name: "lname#{i}", 
                          email: "user#{i}@mail.com",
                          password: "user#{i}")
end

users_seeds.each do |seed|
  User.find_or_create_by(first_name: seed.first_name,
                         last_name: seed.last_name,
                         email: seed.email
  )
end

author_id = User.first.id
tests_seeds = [
  Test.new(title: 'Multiple inheritance', level: 2,
           category_id: Category.where(name: 'C++').take.id,
           user_id: author_id
  ),
  Test.new(title: 'Plotting', level: 0,
           category_id: Category.where(name: 'Python').take.id,
           user_id: author_id
  ),
  Test.new(title: 'Metaprogramming', level: 1,
           category_id: Category.where(name: 'Ruby').take.id,
           user_id: author_id
  )
]

tests_seeds.each do |seed|
  Test.find_or_create_by(title: seed.title,
                         category_id: seed.category_id,
                         user_id: seed.user_id
  )
end

questions_seeds = [
  Question.new(title: 'What is a virtual inheritance?',
               test_id: Test.where(title: 'Multiple inheritance').take.id
  ),

  Question.new(title: 'How to plot a histogram?',
               test_id: Test.where(title: 'Plotting').take.id
  ),

  Question.new(title: 'What is an eigenclass?',
               test_id: Test.where(title: 'Metaprogramming').take.id
  )
]

questions_seeds.each do |seed|
  Question.find_or_create_by(title: seed.title,
                             test_id: seed.test_id)
end

answers_seeds = [
  Answer.new(
    question_id: Question.where(title: 'What is a virtual inheritance?').take.id,
    body: 'Virtual inheritance is used to solve diamond problem.'
  ),

  Answer.new(
    question_id: Question.where(title: 'How to plot a histogram?').take.id,
    body: 'By using pyplot.hist method'
  ),

  Answer.new(
    question_id: Question.where(title: 'What is an eigenclass?').take.id,
    body: "Eigenclass is an anonymous class that stores object's singleton methods"
  )
]

answers_seeds.each do |seed|
  Answer.find_or_create_by(question_id: seed.question_id,
                           body: seed.body)
end

tests_started_by_user_seeds = [
  TestsStartedByUser.new(
    test_id: Test.where(title: 'Multiple inheritance').take.id,
    user_id: User.where(first_name: 'fname1').take.id
  ),
  TestsStartedByUser.new(
    test_id: Test.where(title: 'Plotting').take.id,
    user_id: User.where(first_name: 'fname1').take.id
  ),
  TestsStartedByUser.new(
    test_id: Test.where(title: 'Metaprogramming').take.id,
    user_id: User.where(first_name: 'fname1').take.id
  )
]

tests_started_by_user_seeds.each do |seed|
  TestsStartedByUser.find_or_create_by(test_id: seed.test_id,
                                       user_id: seed.user_id
  )
end
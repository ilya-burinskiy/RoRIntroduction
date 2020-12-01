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
                         email: seed.email,
                         password: seed.password)
end

author = User.first
tests_seeds = [
  Test.new(title: 'Multiple inheritance', level: 2,
           category: Category.find_by(name: 'C++'),
           author: author),
  Test.new(title: 'Plotting', level: 0,
           category: Category.find_by(name: 'Python'),
           author: author),
  Test.new(title: 'Metaprogramming', level: 1,
           category: Category.find_by(name: 'Ruby'),
           author: author)
]

tests_seeds.each do |seed|
  Test.find_or_create_by(title: seed.title,
                         category: seed.category,
                         author: seed.author)
end

questions_seeds = [
  Question.new(title: 'What is a virtual inheritance?',
               test: Test.find_by(title: 'Multiple inheritance')),

  Question.new(title: 'How to plot a histogram?',
               test: Test.find_by(title: 'Plotting')),

  Question.new(title: 'What is an eigenclass?',
               test: Test.find_by(title: 'Metaprogramming'))
]

questions_seeds.each do |seed|
  Question.find_or_create_by(title: seed.title,
                             test: seed.test)
end

answers_seeds = [
  Answer.new(
    question: Question.find_by(title: 'What is a virtual inheritance?'),
    body: 'Virtual inheritance is used to solve diamond problem.'
  ),

  Answer.new(
    question: Question.find_by(title: 'How to plot a histogram?'),
    body: 'By using pyplot.hist method'
  ),

  Answer.new(
    question: Question.find_by(title: 'What is an eigenclass?'),
    body: "Eigenclass is an anonymous class that stores object's singleton methods"
  )
]

answers_seeds.each do |seed|
  Answer.find_or_create_by(question: seed.question,
                           body: seed.body)
end

tests_started_by_user_seeds = [
  TestsStartedByUser.new(
    test: Test.find_by(title: 'Multiple inheritance'),
    user: User.find_by(first_name: 'fname1')
  ),
  TestsStartedByUser.new(
    test: Test.find_by(title: 'Plotting'),
    user: User.find_by(first_name: 'fname1')
  ),
  TestsStartedByUser.new(
    test: Test.find_by(title: 'Metaprogramming'),
    user: User.find_by(first_name: 'fname1')
  )
]

tests_started_by_user_seeds.each do |seed|
  TestsStartedByUser.find_or_create_by(test: seed.test,
                                       user: seed.user)
end

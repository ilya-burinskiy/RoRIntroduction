# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Category.exists?
  Category.create!([
    { name: 'C++' }, { name: 'Python' }, { name: 'Ruby' }
  ])
end

unless User.exists?
  5.times do |i|
    User.create!([
      { first_name: "fname#{i}", last_name: "lname#{i}",
        email: "user#{i}@mail.com", password: "user#{i}" }
    ])
  end
end

author = User.first
unless Test.exists?
  Test.create!([
    { title: 'Multiple inheritance', level: 2,
      category: Category.find_by(name: 'C++'),
      author: author },
    { title: 'Plotting', level: 0,
      category: Category.find_by(name: 'Python'),
      author: author },

    { title: 'Metaprogramming', level: 1,
      category: Category.find_by(name: 'Ruby'),
      author: author }
  ])
end

unless Question.exists?
  Question.create!([
    { body: 'What is a virtual inheritance?',
      test: Test.find_by(title: 'Multiple inheritance') },
    { body: 'How to plot a histogram?',
      test: Test.find_by(title: 'Plotting') },
    { body: 'What is an eigenclass?',
      test: Test.find_by(title: 'Metaprogramming') }
  ])
end

unless Answer.exists?
  Answer.create!([
    { question: Question.find_by(body: 'What is a virtual inheritance?'),
      body: 'Virtual inheritance is used to solve diamond problem.' },

    {
      question: Question.find_by(body: 'How to plot a histogram?'),
      body: 'By using pyplot.hist method'
    },

    {
      question: Question.find_by(body: 'What is an eigenclass?'),
      body: "Eigenclass is an anonymous class that stores object's singleton methods"
    }
  ])
end

unless TestPassage.exists?
  TestPassage.create!([
    {
      test: Test.find_by(title: 'Multiple inheritance'),
      user: User.find_by(first_name: 'fname1'),
      current_question: Test.find_by(title: 'Multiple inheritance').questions.first
    },
    {
      test: Test.find_by(title: 'Plotting'),
      user: User.find_by(first_name: 'fname1'),
      current_question: Test.find_by(title: 'Plotting').questions.first
    },
    {
      test: Test.find_by(title: 'Metaprogramming'),
      user: User.find_by(first_name: 'fname1'),
      current_question: Test.find_by(title: 'Metaprogramming').questions.first
    }
  ])
end

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
        email: "user#{i}@mail.com", password_digest: Digest::SHA1.hexdigest("user#{i}") }
    ])
  end
end

author = User.first
unless Test.exists?
  Test.create!([
    { title: 'C++ for intermediate programmers', level: 4,
      category: Category.find_by(name: 'C++'),
      author: author },
    { title: 'Python for beginners', level: 0,
      category: Category.find_by(name: 'Python'),
      author: author },

    { title: 'Ruby for beginners', level: 1,
      category: Category.find_by(name: 'Ruby'),
      author: author }
  ])
end

unless Question.exists?
  Question.create!([
    { body: 'Which of the following will cause undefined behavior',
      test: Test.find_by(title: 'C++ for intermediate programmers') },
    { body: 'How many times will the next loop be executed for(int i = 3; i < 10; ++i){}',
      test: Test.find_by(title: 'C++ for intermediate programmers') },

    { body: 'Continue command:',
      test: Test.find_by(title: 'Python for beginners') },
    { body: 'What keyword denotes a function?',
      test: Test.find_by(title: 'Python for beginners') },

    { body: 'What will return the following expression? [1, 2, 3, 4].find { |n| n > 2 }',
      test: Test.find_by(title: 'Ruby for beginners') },
    { body: 'What value will the following expression return? Float("-1.4*2sf5")',
      test: Test.find_by(title: 'Ruby for beginners') }
  ])
end

unless Answer.exists?
  Answer.create!([
    { 
      question: Question.find_by(body: 'Which of the following will cause undefined behavior'),
      body: 'Array index out of bounds',
      correct: true 
    },
    { 
      question: Question.find_by(body: 'Which of the following will cause undefined behavior'),
      body: 'Cast from short to long int',
      correct: false 
    },
    { 
      question: Question.find_by(body: 'Which of the following will cause undefined behavior'),
      body: 'Passing a pointer to an object as an argument',
      correct: false
    },
    { 
      question: Question.find_by(body: 'Which of the following will cause undefined behavior'),
      body: 'Using switch case operator without default',
      correct: false 
    },
    { 
      question: Question.find_by(body: 'How many times will the next loop be executed for(int i = 3; i < 10; ++i){}'),
      body: '6',
      correct: false
    },
    { 
      question: Question.find_by(body: 'How many times will the next loop be executed for(int i = 3; i < 10; ++i){}'),
      body: '8',
      correct: false 
    },
    { 
      question: Question.find_by(body: 'How many times will the next loop be executed for(int i = 3; i < 10; ++i){}'),
      body: '0',
      correct: false
    },
    { 
      question: Question.find_by(body: 'How many times will the next loop be executed for(int i = 3; i < 10; ++i){}'),
      body: '7',
      correct: true 
    },


    {
      question: Question.find_by(body: 'Continue command:'),
      body: 'Exits the loop',
      correct: false 
    },
    {
      question: Question.find_by(body: 'Continue command:'),
      body: 'Allows you to go to the next iteration of the cycle',
      correct: true
    },
    {
      question: Question.find_by(body: 'Continue command:'),
      body: 'Prints text',
      correct: false 
    },
    {
      question: Question.find_by(body: 'What keyword denotes a function?'),
      body: 'With func keyword',
      correct: false 
    },
    {
      question: Question.find_by(body: 'What keyword denotes a function?'),
      body: 'With function keyword',
      correct: false
    },
    {
      question: Question.find_by(body: 'What keyword denotes a function?'),
      body: 'With def keyword',
      correct: true
    },


    {
      question: Question.find_by(body: 'What will return the following expression? [1, 2, 3, 4].find { |n| n > 2 }'),
      body: "[4]",
      correct: false
    },
    {
      question: Question.find_by(body: 'What will return the following expression? [1, 2, 3, 4].find { |n| n > 2 }'),
      body: "3",
      correct: true
    },
    {
      question: Question.find_by(body: 'What will return the following expression? [1, 2, 3, 4].find { |n| n > 2 }'),
      body: "2",
      correct: false
    },
    {
      question: Question.find_by(body: 'What will return the following expression? [1, 2, 3, 4].find { |n| n > 2 }'),
      body: "[3, 4]",
      correct: false
    },
    {
      question: Question.find_by(body: 'What value will the following expression return? Float("-1.4*2sf5")'),
      body: "-2.8",
      correct: false
    },
    {
      question: Question.find_by(body: 'What value will the following expression return? Float("-1.4*2sf5")'),
      body: "-1",
      correct: false 
    },
    {
      question: Question.find_by(body: 'What value will the following expression return? Float("-1.4*2sf5")'),
      body: "1.425",
      correct: false
    },
    {
      question: Question.find_by(body: 'What value will the following expression return? Float("-1.4*2sf5")'),
      body: "ArgumentError: invalid value for Float()",
      correct: true
    }
  ])
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_categories
  Category.create([{ name: 'C++' }, { name: 'Python' }, { name: 'Ruby' }])
end

def seed_users(n)
  n.times do |i|
    User.create(
      { first_name: "fname#{i}",
        last_name: "sname#{i}",
        email: "user#{i}@mail.com",
        password: "user#{i}" }
    )
  end
end

def seed_tests
  author_id = User.first.id
  Test.create([
                { title: 'Multiple inheritance', level: 2,
                  category_id: Category.where(name: 'C++').take.id,
                  user_id: author_id },

                {
                  title: 'Plotting', level: 0,
                  category_id: Category.where(name: = 'Python').take.id,
                  user_id: author_id
                },

                { title: 'Metaprogramming', level: 1,
                  category_id: Category.where(name: = 'Ruby').take.id,
                  user_id: author_id }
              ])
end

def seed_questions
  Question.create([
                    {
                      title: 'What is a virtual inheritance?',
                      test_id: Test.where(title: 'Multiple inheritance').take.id
                    },

                    {
                      title: 'How to plot a histogram?',
                      test_id: Test.where(title: 'Plotting').take.id
                    },

                    {
                      title: 'What is an eigenclass?',
                      test_id: Test.where(title: 'Metaprogramming').take.id
                    }
                  ])
end

def seed_answers
  Answer.create([
                  {
                    question_id: Question.where(title: 'What is a virtual inheritance?').take.id,
                    body: 'Virtual inheritance is used to solve diamond problem.'
                  },

                  {
                    question_id: Question.where(title: 'How to plot a histogram?').take.id,
                    body: 'By using pyplot.hist method'
                  },

                  {
                    question_id: Question.where(title: 'What is an eigenclass?').take.id,
                    body: "Eigenclass is an anonymous class that stores object's singleton methods"
                  }
                ])
end

def seed_tests_started_by_user
  TestsStartedByUser.create([

                              { test_id: Test.where(title: 'Multiple inheritance').take.id,
                                user_id: User.where(first_name: 'fname1').take.id },

                              {
                                test_id: Test.where(title: 'Plotting').take.id,
                                user_id: User.where(first_name: 'fname1').take.id
                              },

                              {
                                test_id: Test.where(title: 'Metaprogramming').take.id,
                                user_id: User.where(first_name: 'fname1').take.id
                              }

                            ])
end

seed_categories
seed_users(5)
seed_tests
seed_tests_started_by_user

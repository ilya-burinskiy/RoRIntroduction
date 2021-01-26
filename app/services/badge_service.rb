class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    if @test_passage.passed?
      badge_for_passing_test_on_first_try if passed_test_on_first_try?
      badge_for_passing_cpp_category_tests if cpp_category_tests_passed?
      badge_for_passing_ruby_category_tests if ruby_category_tests_passed?
      badge_for_passing_all_first_level_tests if all_first_level_tests_passed?
    end
  end

  def passed_test_on_first_try?
    TestPassage.where(test: @test, user: @user).count == 1
  end

  def cpp_category_tests_passed?
    cpp_category = Category.find_by(name: 'C++')
    return false if @test.category != cpp_category

    user_passed_tests.where(category_id: cpp_category.id).count % Test.where(category: cpp_category).count == 0
  end

  def ruby_category_tests_passed?
    ruby_category = Category.find_by(name: 'Ruby')
    return false if @test.category != ruby_category

    user_passed_tests.where(category_id: ruby_category.id).count % Test.where(category: ruby_category).count == 0
  end

  def user_passed_tests
    Test.joins("INNER JOIN test_passages ON tests.id = test_passages.test_id AND test_passages.passed = 1")
  end

  def all_first_level_tests_passed?
    user_passed_tests.where(level: 1).uniq.count == Test.where(level: 1).count
  end

  def badge_for_passing_test_on_first_try
    @user.badges.push(Badge.find_by(rule: 'Passed the test on the first try'))
  end

  def badge_for_passing_cpp_category_tests
    @user.badges.push(Badge.find_by(rule: 'Passed all tests from the C++ category'))
  end

  def badge_for_passing_ruby_category_tests
    @user.badges.push(Badge.find_by(rule: 'Passed all tests from the Ruby category'))
  end

  def badge_for_passing_all_first_level_tests
    @user.badges.push(Badge.find_by(rule: 'Passed all first level tests'))
  end
end

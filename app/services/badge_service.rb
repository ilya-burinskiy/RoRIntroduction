class BadgeService

  class << self
    def call(test_passage)
      @user = test_passage.user
      @test = test_passage.test

      if test_passage.passed?
        Badge.all.map { |badge| give_badge(badge) }
      end
    end

    private

    def give_badge(badge)
      case badge.rule
      when "passing_test_on_first_try"
        give_badge_for_passing_test_on_first_try(badge)
      when "passing_all_tests_from_category"
        give_badge_for_passing_all_tests_from_category(badge)
      when "passing_all_tests_by_level"
        give_badge_for_passing_all_tests_by_level(badge)
      end
    end

    def give_badge_for_passing_test_on_first_try(badge)
      test = Test.find(badge.rule_property)
      @user.badges.push(badge) if passed_test_on_first_try?(test)
    end

    def give_badge_for_passing_all_tests_from_category(badge)
      category = Category.find(badge.rule_property)
      @user.badges.push(badge) if passed_all_tests_from_category?(category)
    end

    def give_badge_for_passing_all_tests_by_level(badge)
      level = badge.rule_property
      @user.badges.push(badge) if passed_all_tests_by_level(level)
    end

    def passed_test_on_first_try?(test)
      TestPassage.where(test: test, user: @user).count == 1
    end

    def passed_all_tests_from_category?(category)
      return false if @test.category != category

      user_passed_tests.where(category_id: category.id).count % Test.where(category: category).count == 0
    end

    def passed_all_tests_by_level(level)
      return false if @test.level != level

      user_passed_tests.where(level: level).uniq.count == Test.where(level: level).count
    end

    def user_passed_tests
      Test.joins(
        "INNER JOIN test_passages ON tests.id = test_passages.test_id"
      ).where("test_passages.user_id = ? AND test_passages.passed = 1", @user.id)
    end
  end
end

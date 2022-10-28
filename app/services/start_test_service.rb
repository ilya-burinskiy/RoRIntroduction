class StartTestService
  def initialize(user, test)
    @user = user
    @test = test
  end

  def call
    TestPassage.create(
      user: @user,
      test: @test,
      current_question: @test.questions.order(:created_at).first
    )
  end
end

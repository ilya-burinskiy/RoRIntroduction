class TestsController < ApplicationController
  before_action :find_test, only: %i[show]
  before_action :find_tests, only: %i[index]
  before_action :find_questions, only: %i[show]

  def index
  end

  def show
    @questions = @test.questions
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_tests
    @tests = Test.all
  end

  def find_questions
    @questions = @test.questions
  end

end

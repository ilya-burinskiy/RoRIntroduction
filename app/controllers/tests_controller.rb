class TestsController < ApplicationController
  before_action :all_tests, only: %i[index]
  before_action :find_test, only: %i[show]

  def index
  end

  def show
    redirect_to test_questions_path(@test)
  end

  private

  def all_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

end

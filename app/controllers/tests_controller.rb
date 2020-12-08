class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  def index
  end

  def show
    @questions = @test.questions
  end

  private

  def find_test
    @test = Test.find(params[:id])
    @tests = Test.all
  end

end

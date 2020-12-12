class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update start]
  before_action :find_user, only: %i[start]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @test.update(test_params)
      redirect_to test_path(@test)
    else
      render :edit
    end
  end

  def start
    @user.started_tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = User.first
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end
end

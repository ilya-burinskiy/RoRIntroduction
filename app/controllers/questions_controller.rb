class QuestionsController < ApplicationController
  before_action :find_question, only: %i[edit show update destroy]
  before_action :find_test, only: %i[index create new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    @test = @question.test
  end

  def new
    @question = Question.new
  end

  def edit
    @test = @question.test
  end

  def update
    @test = @question.test
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def destroy
    @test = @question.test
    @question.destroy!
    redirect_to test_path(@test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]
  before_action :find_question, only: %i[destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: @test.questions
  end

  def show
    render json: @question
  end

  def new
  end

  def create
    question = Question.new(question_params)
    if question.valid?
      question.save
      redirect_to test_questions_path
    else
      render :new
    end
  end

  def destroy
    @question.destroy!
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
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

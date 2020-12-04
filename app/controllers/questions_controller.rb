class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_with_invalid_question_params

  def index
    render json: @test.questions
  end

  def show
    render json: Question.find_by!(id: params[:id])
  end

  def new
  end

  def create
    question = Question.create!(question_params)
    render json: question.inspect
  end

  def destroy
    Question.find_by!(id: params[:id]).delete
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @test = Test.find_by!(id: params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end

  def rescue_with_invalid_question_params
    render plain: 'Invalid question parameters'
  end
end

class Admin::QuestionsController < Admin::BaseController
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    @question = find_question
    @test = @question.test
  end

  def new
    @test = find_test
    @question = Question.new
  end

  def edit
    @question = find_question
    @test = @question.test
  end

  def update
    @question = find_question
    @test = @question.test
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  def create
    @test = find_test
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def destroy
    question = find_question
    question.destroy!
    redirect_to admin_test_path(question.test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    Test.find(params[:test_id])
  end

  def find_question
    Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end

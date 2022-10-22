class Admin::AnswersController < Admin::BaseController
  before_action :authenticate_user!

  def show
    @answer = find_answer
  end

  def new
    @question = find_qeustion
    @answer = @question.answers.new
  end

  def edit
    @answer = find_answer
  end

  def create
    @question = find_qeustion
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      redirect_to admin_answer_path(@answer)
    else
      render :new
    end
  end

  def update
    @answer = find_answer
    if @answer.update(answer_params)
      redirect_to admin_answer_path(@answer)
    else
      render :edit
    end
  end

  def destroy
    answer = find_answer
    answer.destroy
    redirect_to admin_question_path(answer.question)
  end

  private

  def find_qeustion
    Question.find(params[:question_id])
  end

  def find_answer
    Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end

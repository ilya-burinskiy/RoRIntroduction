class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def gist
    response = GistQuestionService.new(@test_passage.current_question).call

    if response
      @gist = Gist.new({
        question: @test_passage.current_question,
        url: response.html_url,
        user: @test_passage.user
      })
      flash_options = @gist.save ? { notice: "#{t('.success')} #{@gist.url}" } : { notice: t(".failure") }
    else
      flash_options = { notice: t(".failure") }
    end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end


  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

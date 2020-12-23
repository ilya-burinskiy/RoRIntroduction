class GistsController < ApplicationController
  before_action :find_test_passage, only: :create

  def create
    response = GistQuestionService.new(@test_passage.current_question).call

    if response.success?
      @gist = Gist.create({
        question: @test_passage.current_question,
        url: response.gist_url,
        user: @test_passage.user
      })

      flash_options = { notice: "#{t('.success')} #{@gist.url}" }
    else
      flash_options = { notice: t(".failure") }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end

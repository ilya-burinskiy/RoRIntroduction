class GistsController < ApplicationController
  before_action :find_test_passage, only: :create

  def create
    response = GitHub::GistQuestionService.new(@test_passage.current_question).call

    if response.success?
      @gist = Gist.create({
        question: @test_passage.current_question,
        url: response.gist_url,
        hash_from_url: response.gist_hash,
        user: @test_passage.user
      })

      gist_link = "<a href=\"#{@gist.url}\" rel=nofollow target=\"_blank\">#{@gist.url}</a>"
      flash[:notice] = "#{t('.success')} #{gist_link}"
    else
      flash[:notice] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end

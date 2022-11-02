class TestPassagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @test_passage = find_test_passage
  end

  def result
    @test_passage = find_test_passage
  end

  def update
    @test_passage = find_test_passage
    @progress_percent = AcceptAnswersService
                        .new(@test_passage, Answer.where(id: params[:answer_ids])).call
    if @test_passage.completed?
      @passage_percent = FinishTestService.new(@test_passage).call
      render :result
    else
      render :show
    end
  end

  private

  def find_test_passage
    TestPassage.find(params[:id])
  end
end

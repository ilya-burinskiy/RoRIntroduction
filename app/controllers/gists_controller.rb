class GistsController < ApplicationController
  def create
    test_passage = TestPassage.find(params[:test_passage_id])
    response = GitHub::GistQuestionService.new(test_passage.current_question).call

    if response.success?
      gist = Gist.create({
        question: test_passage.current_question,
        url: response.gist_url,
        hash_from_url: response.gist_hash,
        user: test_passage.user
      })

      flash[:notice] = t('.success_html',
        href: gist.url, 
        gist:  gist.url,
      )
    else
      flash[:notice] = t('.failure')
    end

    redirect_to test_passage
  end
end

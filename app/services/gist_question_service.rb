require 'octokit'

class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    configure_endpoint
    @client = client || Octokit::Client.new(access_token: Rails.application.credentials.github[:access_token])
  end

  def call
    response = @client.create_gist(gist_params)
  rescue Octokit::ClientError
    nil
  end

  private

  def configure_endpoint
    Octokit.configure do |c|
      c.api_endpoint = Rails.application.credentials.github[:root_endpoint]
    end
  end

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt': {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end

class GistQuestionService
  ACCESS_TOKEN = Rails.application.credentials.github[:access_token]
  ROOT_ENDPOINT = Rails.application.credentials.github[:root_endpoint]

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    configure_endpoint
    @client = client || Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def call
    GitHubClientResponse.new(create_gist)
  end

  def success?
    @success
  end

  private

  def create_gist
    gist_resource = @client.create_gist(gist_params)
  rescue Octokit::ClientError
    nil
  end

  def configure_endpoint
    Octokit.configure do |c|
      c.api_endpoint = ROOT_ENDPOINT
    end
  end

  def gist_params
    {
      description: I18n.t('.description', title: @test.title),
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

module GitHub
  class GistQuestionService
    ACCESS_TOKEN = Rails.application.credentials.github[:access_token]

    def initialize(question, client: Octokit::Client.new(access_token: ACCESS_TOKEN))
      @question = question
      @test = @question.test
      @client = client
    end

    def call
      git_hub_client_response = GitHubServiceResponse.new
      gist_resource = @client.create_gist(gist_params)
      git_hub_client_response.gist_url = gist_resource.html_url
      git_hub_client_response.gist_hash = gist_resource.id
      git_hub_client_response
    rescue Octokit::ClientError
      git_hub_client_response
    end

    private

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
      [@question.body, *@question.answers.pluck(:body)].join("\n")
    end
  end
end

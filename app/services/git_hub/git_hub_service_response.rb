module GitHub
  class GitHubServiceResponse
    attr_accessor :gist_url, :gist_hash

    def success?
      gist_url.present?
    end
  end
end

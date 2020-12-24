class GitHubClientResponse
  attr_accessor :gist_url, :gist_hash

  def success?
    !gist_url.nil?
  end
end

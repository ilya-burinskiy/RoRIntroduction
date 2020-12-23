class GitHubClientResponse
  attr_reader :gist_url, :gist_hash

  def initialize(gist_resource)
    unless gist_resource.nil?
      @gist_url = gist_resource.html_url
      @success = true
    else
      @success = false
    end
  end

  def success?
    @success
  end
end

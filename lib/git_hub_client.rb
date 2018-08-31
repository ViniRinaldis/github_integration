require 'json'
require_relative 'rest_client'

class GitHubClient
  COMMITS_URI = "https://api.github.com/repos/$1/$2/commits"
  COMMITTER_URI = "https://api.github.com/users/"
  
  def initialize(organization:, project:)
    @commit_uri = build_commit_uri(organization: organization,
                                   project: project)
    @rest_client = RestClient.new
  end

  def get_commits
    uri = URI(@commit_uri)
    response = @rest_client.get(uri)
    JSON.parse(response)
  end

  def get_committer(login: )
    uri = COMMITTER_URI + login
    uri = URI(uri)
    response = @rest_client.get(uri)
    JSON.parse(response)
  end

  private
  def build_commit_uri(organization:, project:)
    COMMITS_URI.gsub("$1",organization).gsub("$2", project)
  end
end

#GitHubClient.get_commits
#GitHubClient.get_committer(username: "vinirinaldis")

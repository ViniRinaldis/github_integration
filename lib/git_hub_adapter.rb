require_relative 'git_hub_client'

class GitHubAdapter
  
  def initialize(organization:, project:)
    @client = GitHubClient.new(organization: organization, project: project)
  end
  def committers
    committers_data = response.uniq
    committers_data.map do |result|
      committer_json  = @client.get_committer(login: result["login"])
      OpenStruct.new(login:committer_json["login"],
                     name: committer_json["name"],
                     email: committer_json["email"],
                     avatar_url:committer_json["avatar_url"],
                     commit_counter: count_commits_of_committer(login: committer_json["login"]))
    end
  end
  
  private
  def response
    @response ||= @client.get_commits.map{|a| a["committer"]}.compact
  end

  def count_commits_of_committer(login: )
    @response.select{|committer| committer["login"] == login}.count
  end
end

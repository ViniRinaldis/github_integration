require_relative '../lib/git_hub_client'

describe GitHubClient do 
  subject { described_class.new(organization: 'ViniRinaldis', project: 'Sex-Definer-PL-SQL-BRASIL')}
  describe "#get_commits" do
    it "return commits for project" do 
      expect(subject.get_commits.count).to eq(2)
    end
  end
  describe "#get_committer" do 
    it "return committer information" do
      data = {"login"=>"ViniRinaldis",
              "id"=>15875781,
              "node_id"=>"MDQ6VXNlcjE1ODc1Nzgx",
              "avatar_url"=>"https://avatars3.githubusercontent.com/u/15875781?v=4",
              "gravatar_id"=>"",
              "url"=>"https://api.github.com/users/ViniRinaldis",
              "html_url"=>"https://github.com/ViniRinaldis",
              "followers_url"=>"https://api.github.com/users/ViniRinaldis/followers",
              "following_url"=>
        "https://api.github.com/users/ViniRinaldis/following{/other_user}",
        "gists_url"=>"https://api.github.com/users/ViniRinaldis/gists{/gist_id}",
        "starred_url"=>
      "https://api.github.com/users/ViniRinaldis/starred{/owner}{/repo}",
        "subscriptions_url"=>
      "https://api.github.com/users/ViniRinaldis/subscriptions",
        "organizations_url"=>"https://api.github.com/users/ViniRinaldis/orgs",
        "repos_url"=>"https://api.github.com/users/ViniRinaldis/repos",
        "events_url"=>"https://api.github.com/users/ViniRinaldis/events{/privacy}",
        "received_events_url"=>
      "https://api.github.com/users/ViniRinaldis/received_events",
        "type"=>"User",
        "site_admin"=>false,
        "name"=>"Vinicius Rinaldis",
        "company"=>"@Pitzi ",
        "blog"=>"",
        "location"=>nil,
        "email"=>nil,
        "hireable"=>nil,
        "bio"=>"Ruby on Rails developer\r\n",
        "public_repos"=>6,
        "public_gists"=>0,
        "followers"=>2,
        "following"=>3,
        "created_at"=>"2015-11-16T17:48:58Z",
        "updated_at"=>"2018-04-29T01:24:11Z"}
      expect(subject.get_committer(login: "vinirinaldis")).to eq(data)
    end
  end
end

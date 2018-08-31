require_relative '../lib/rest_client'
describe RestClient do 
  subject { described_class.new}
  describe "#get" do
    it "return json when success" do
      raw_json = "{\"login\":\"ViniRinaldis\",\"id\":15875781,\"node_id\":\"MDQ6VXNlcjE1ODc1Nzgx\",\"avatar_url\":\"https://avatars3.githubusercontent.com/u/15875781?v=4\",\"gravatar_id\":\"\",\"url\":\"https://api.github.com/users/ViniRinaldis\",\"html_url\":\"https://github.com/ViniRinaldis\",\"followers_url\":\"https://api.github.com/users/ViniRinaldis/followers\",\"following_url\":\"https://api.github.com/users/ViniRinaldis/following{/other_user}\",\"gists_url\":\"https://api.github.com/users/ViniRinaldis/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/ViniRinaldis/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/ViniRinaldis/subscriptions\",\"organizations_url\":\"https://api.github.com/users/ViniRinaldis/orgs\",\"repos_url\":\"https://api.github.com/users/ViniRinaldis/repos\",\"events_url\":\"https://api.github.com/users/ViniRinaldis/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/ViniRinaldis/received_events\",\"type\":\"User\",\"site_admin\":false,\"name\":\"Vinicius Rinaldis\",\"company\":\"@Pitzi \",\"blog\":\"\",\"location\":null,\"email\":null,\"hireable\":null,\"bio\":\"Ruby on Rails developer\\r\\n\",\"public_repos\":7,\"public_gists\":0,\"followers\":2,\"following\":3,\"created_at\":\"2015-11-16T17:48:58Z\",\"updated_at\":\"2018-04-29T01:24:11Z\"}"
      expect(subject.get(URI("https://api.github.com/users/vinirinaldis"))).to eq(raw_json)
    end
  end
end

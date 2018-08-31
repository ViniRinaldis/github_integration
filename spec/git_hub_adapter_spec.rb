require_relative '../lib/git_hub_adapter'

describe GitHubAdapter do 
  subject{ described_class.new(organization: "ViniRinaldis", project: "Sex-Definer-PL-SQL-BRASIL")}

  describe "#committers" do 
    it "returns committers information" do
      expect(subject.committers.last.name).to eq("Vinicius Rinaldis")
      expect(subject.committers.last.login).to eq("ViniRinaldis")
    end
  end
end

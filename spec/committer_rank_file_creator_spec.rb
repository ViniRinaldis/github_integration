require_relative '../lib/committer_rank_file_creator'

describe CommitterRankFileCreator do
  subject { described_class.new(organization: "ViniRinaldis" , project:"Sex-Definer-PL-SQL-BRASIL")}
  describe "#generate_file" do
    after(:each) do
      `rm #{@file_name}`
    end
    it "generates file for committers list" do
      @file_name = subject.generate_file
      file_content = open("./#{@file_name}").map{|a| a}.join("")
      result = "GitHub Web Flow;;web-flow;https://avatars3.githubusercontent.com/u/19864447?v=4;1;\nVinicius Rinaldis;;ViniRinaldis;https://avatars3.githubusercontent.com/u/15875781?v=4;1;\n"
      expect(file_content).to eq(result)
    end
  end
end

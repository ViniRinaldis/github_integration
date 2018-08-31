require_relative 'git_hub_adapter'

class CommitterRankFileCreator
  
  def initialize(organization: , project:)
    @organization = organization
    @project = project
  end

  def generate_file
    @file_name = "#{project_name_formatted}_#{Time.now.strftime("%Y_%m_%d_%H_%M_%S")}.txt"
    @committers = GitHubAdapter.new(organization: @organization, project: @project).committers
    file = File.open(@file_name, "w") do |f|
      @committers.sort{|a,b| b.commit_counter <=> a.commit_counter}.each do |committer|
        f.write("#{committer.name};#{committer.email};#{committer.login};#{committer.avatar_url};#{committer.commit_counter};\n") 
      end
    end
    @file_name
  end

  private
  def project_name_formatted
    @project.downcase.gsub(/[^\w]/,"_")
  end
end

require "spec_helper"

describe Repomap::Repository do
  let (:url) { 'https://github.com/heelhook/repomap.git' }
  let (:name) { 'heelhook/repomap' }
  let (:repository) { Repomap::Repository.new url, name }

  context '#clone' do
    it "clones the requested repo" do
      repository.clone
      Dir.exists?(repository.directory).should be_true
    end
  end

  context '#process' do
    before :all do
      repository.process
    end

    it "creates a node for the repository" do
      repository.node.should_not be_nil
    end

    it "points to files" do
      repository.node.rel?(:outgoing, :files).should_not be_nil
    end
  end

  context "finding an existent repository" do
    let (:repository) { Repomap::Repository.new url, name }

    it "points to files" do
      repository.node.rel?(:outgoing, :files).should_not be_nil
    end
  end
end
require 'spec_helper'

describe Repomap do
  it "has a neo4j setup" do
    Repomap.neo4j.should_not be_nil
  end

  it "has a temporary setup" do
    Repomap.tmp_path.should_not be_nil
  end

  it "has an existent temporary setup" do
    Dir.exists?(Repomap.tmp_path).should be_true
  end
end

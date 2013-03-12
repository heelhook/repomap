module Repomap
  class Repository
    attr_reader :url, :name

    def initialize url, name
      @url  = url
      @name = name.gsub('/','-')
    end

    # Directory where the repository is to be checked out
    #
    # Returns a String.
    def directory
      File.join("#{Repomap.tmp_path}", @name)
    end

    # Graph vertex that represents the repository in the graph
    #
    # Returns a Neography::Node.
    def node
      @node ||= Neography::Node.find("repository_index", @name)
    rescue Neography::NotFoundException
      raise NotFound
    end

    # Clones a repository based on the provided URL
    #
    # Returns a Boolean.
    def clone
      system "git clone #{url} #{directory}"
    end

    # Creates the graph of the repository
    def process
      repo = Rugged::Repository.new(directory)

      # Create repository node
      @node = Neography::Node.create("name" => @name)

      # Cache the files
      @file = Hash.new { |hash, key| hash[key] = Neography::Node.create("name" => key) }

      # Walk repo
      walker = Rugged::Walker.new()
    end
  end

  class NotFound < Exception; end
end
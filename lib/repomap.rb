require 'repomap/repository'
require 'rugged'
require 'neography'

module Repomap
  VERSION = '0.1'
  attr_accessor :neo4j, :tmp_path

  extend self
end
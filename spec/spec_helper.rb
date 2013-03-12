require 'bundler/setup'
require 'repomap'

Repomap.neo4j = 'localhost:7474'
Repomap.tmp_path = File.expand_path('tmp/repos')

FileUtils.rm_rf Repomap.tmp_path
Dir.mkdir Repomap.tmp_path
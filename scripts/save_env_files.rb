# frozen_string_literal: true

require 'fileutils'
require 'pry-byebug'
SAVE_TO = File.expand_path('~/notes/TT/config/env_files')
FileUtils.mkdir_p(SAVE_TO)
Dir['./../code/*/.env'].each do |path|
  next if path =~ %r{/^\.\/#{SAVE_TO}/}

  dest = File.join(SAVE_TO, path.gsub('/', '')[1..-1])
  puts "Copying #{path} to #{dest}"
  FileUtils.cp(path, dest)
end

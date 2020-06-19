# frozen_string_literal: true

require 'fileutils'
require 'pry-byebug'
RECOVER_FROM = File.expand_path('~/notes/TT/config/env_files')
Dir['./*/'].each do |path|
  saved_env_path = File.join(RECOVER_FROM, path.gsub(%r{/^.\//}, '')
                                               .gsub(%r{/\/$/}, '') + '.env')
                       .to_s
  unless File.exist?(saved_env_path)
    puts "Skipping #{path} (no saved env)"
    next
  end
  dot_env_path = File.join(path, '.env').to_s
  if !File.exist?(dot_env_path)
    FileUtils.cp(saved_env_path, dot_env_path)
    puts "Init #{path}"
  else
    puts "Skipping #{path} (.env exists)"
  end
end

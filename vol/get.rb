require 'open-uri'
require 'mharris_ext'

input_dir = File.dirname(__FILE__) + "/../spec/input"

files = {}

files["results.html"] = "http://thepiratebay.sx/search/nba%202013/0/7/0"

files.each do |short_path,url|
  path = "#{input_dir}/#{short_path}"
  File.create path, open(url).read
end


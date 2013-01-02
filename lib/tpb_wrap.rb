require 'nokogiri'
require 'mharris_ext'
require 'open-uri'

%w(page source media).each do |f|
  load File.expand_path(File.dirname(__FILE__)) + "/tpb_wrap/#{f}.rb"
end
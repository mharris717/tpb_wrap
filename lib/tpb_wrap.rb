require 'nokogiri'
require 'mharris_ext'
require 'open-uri'
require 'oauth'

%w(cache page source media web).each do |f|
  load File.expand_path(File.dirname(__FILE__)) + "/tpb_wrap/#{f}.rb"
end

module TpbWrap
  class << self
    def magnet_url(name)
      Media.new(:name => name).magnet_url
    end
    def source(name)
      Media.new(:name => name).first_source
    end
  end
end
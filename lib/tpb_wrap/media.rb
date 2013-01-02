module TpbWrap
  class Media
    include FromHash
    attr_accessor :name
    def search_url
      n = URI::encode(name)
      "http://thepiratebay.se/search/#{n}/0/7/0"
    end
    def magnet_url
      Page.new(:url => search_url).first_source.magnet_url
    end
  end
end
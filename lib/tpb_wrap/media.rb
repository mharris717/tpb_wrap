module TpbWrap
  class Media
    include FromHash
    attr_accessor :name
    def search_url
      "http://thepiratebay.se/search/#{name}/0/7/0"
    end
    def magnet_url
      Page.new(:url => search_url).first_source.magnet_url
    end
  end
end
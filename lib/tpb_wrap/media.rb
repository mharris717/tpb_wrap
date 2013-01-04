module TpbWrap
  class Media
    include FromHash
    attr_accessor :name
    def search_url
      n = URI::encode(name)
      "http://thepiratebay.se/search/#{n}/0/7/0"
    end
    fattr(:first_source) do
      Page.new(:url => search_url).first_source
    end
    
    def magnet_url
      first_source.magnet_url
    end
    def category
      first_source.category
    end
    def source_url
      first_source.page_url
    end
    def source_title
      first_source.title
    end
  end
end
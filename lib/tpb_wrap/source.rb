module TpbWrap
  class Source
    include FromHash
    attr_accessor :page_url
    def page_url=(url)
      url = "http://thepiratebay.se#{url}" unless url =~ /http/
      @page_url = url
    end
    fattr(:doc) do
      Nokogiri::HTML(page_body)
    end
    fattr(:page_body) do
      open(page_url)
    end
    fattr(:magnet_url) do
      doc.css("div.download a").first.attribute('href')
    end
  end
end
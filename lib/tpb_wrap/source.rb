module TpbWrap
  class Source
    include FromHash
    attr_accessor :page_url
    def page_url=(url)
      unless url =~ /http/
        url = url.to_s.split("/")[0..2].join("/")
        url = "http://thepiratebay.se#{url}" 
      end
      @page_url = url
    end
    fattr(:doc) do
      Nokogiri::HTML(page_body)
    end
    fattr(:page_body) do
      get_cached_body(page_url)
    end
    fattr(:magnet_url) do
      doc.css("div.download a").first.attribute('href')
    end
    def category
      a = doc.css("a").find { |x| x.attribute("title").to_s.strip.downcase == 'more from this category' }
      a.text()
    end
    def title
      doc.css("div#title").first.text().strip
    end
  end
end
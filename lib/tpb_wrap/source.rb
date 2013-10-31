module TpbWrap
  class Source
    include FromHash
    attr_accessor :page_url, :seeds, :title
    def page_url=(url)
      unless url =~ /http/
        url = url.to_s.split("/")[0..2].join("/")
        url = "http://thepiratebay.sx#{url}" 
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

    def as_json(*args)
      {title: title, seeds: seeds, page_url: page_url, magnet_url: magnet_url}
    end

    class << self
      def from_row(row)
        res = new
        tds = row.css("td").map { |x| x.text.strip }
        link = row.css("a.detLink")
        res.title = link.text.strip
        res.seeds = tds[2].to_i
        res.page_url = link.attribute('href')
        res
      end
    end
  end
end
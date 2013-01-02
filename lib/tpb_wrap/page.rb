module TpbWrap
  class Page
    include FromHash
    attr_accessor :body
    def url=(url)
      self.body = open(url).read
    end
    fattr(:doc) do
      Nokogiri::HTML(body)
    end
    def first_source
      link = doc.css("a.detLink").first
      Source.new(:page_url => link.attribute("href"))
    end
  end
end
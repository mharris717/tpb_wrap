module TpbWrap
  class Page
    include FromHash
    attr_accessor :body
    def url=(url)
      self.body = get_cached_body(url)
    end
    fattr(:doc) do
      Nokogiri::HTML(body)
    end
    fattr(:sources) do
      source_rows.map do |row|
        Source.from_row(row)
      end
    end

    def source_rows
      doc.css("table#searchResult tr").select do |row|
        row.css("a.detLink").size > 0
      end
    end

    def first_source
      sources.first
    end
  end
end
#(0...8).each { |x| puts "" }


#puts TpbWrap.magnet_url('Batman Begins')

def media
  $media ||= TpbWrap::Media.new(:name => "Chronicle")
end

puts media.search_url
puts media.source_url
puts media.magnet_url
puts media.category

puts media.first_source.doc.css("a").size

media.first_source.doc.css("a").each do |a|
  t = a.attribute('title')
  #puts "'#{t}'"
end
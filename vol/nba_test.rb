load "lib/tpb_wrap.rb"

def nba_source(away,home,date)
  date_str = date.strftime("%d %b")
  terms = ["nba",2013,away,home,date_str]
  search_str = terms.join("\n")
  TpbWrap.source(search_str)
end

d = Date.new(2013,10,29)
source = nba_source("Lakers","Clippers",d)

puts source.title
puts source.seeds
puts source.magnet_url
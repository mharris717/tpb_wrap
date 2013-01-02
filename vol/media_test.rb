(0...8).each { |x| puts "" }

m = TpbWrap::Media.new(:name => "Chronicle")
puts m.magnet_url
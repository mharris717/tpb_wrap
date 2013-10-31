require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Page" do
  let(:body) do
    dir = File.dirname(__FILE__) + "/input"
    File.read "#{dir}/results.html"
  end
  let(:page) do
    TpbWrap::Page.new(:body => body)
  end

  it 'source count' do
    page.sources.size.should == 30
  end

  it 'source rows' do
    page.source_rows.size.should == 30
  end

  it 'source seeds' do
    page.sources.first.seeds.should == 571
  end

  it 'source url' do
    page.sources.first.page_url.should == "http://thepiratebay.sx/torrent/9121603"
  end

  it 'source title' do
    page.sources.first.title.should == "NBA.2013.RS.(29 oct).LA.Clippers.v.LA.Lakers.720p.60fps"
  end
end

require 'sinatra/base'
require 'json'

module TpbWrap
  class Web < Sinatra::Base
    helpers do
      fattr(:media) do
        name = params[:name]
        TpbWrap::Media.new(:name => name)
      end
    end

    get "/source" do
      media.to_json
    end

    get "/link" do
      s = media.first_source
      "<a href=\"#{s.magnet_url}\">#{s.title}</a>"
    end

    get "/link/:name" do
      s = media.first_source
      "<a href=\"#{s.magnet_url}\">#{s.title}</a>"
    end
  end
end
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
  end
end
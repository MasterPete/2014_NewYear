require 'sinatra'
require 'json'
require 'haml'
require 'sass'

set :haml, format: :html5
set :bind, '0.0.0.0'

@@wishes = [
{ name: "petec", fullname: "Pete Chemsripong", word: "Happy New Year!!" },
{ name: "liviu", fullname: "Liviu Constantinescu", word: "Happy New Year!!" }
]



get '/:name' do
  @wishes = @@wishes
  haml :index
end



get '/stylesheets/*.css' do
  content_type 'text/css', charset: 'utf-8'
  filename = params[:splat].first
  sass filename.to_sym, views: "#{settings.root}/assets/stylesheets"
end



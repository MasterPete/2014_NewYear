require 'sinatra'
require 'json'
require 'haml'
require 'sass'

set :haml, format: :html5
set :bind, '0.0.0.0'

@@offers = [
{ name: "Traditional Value Range Pizzas", price: "9.99", day: "Today Only", featured: "Featured Offer" },
{ name: "3 Traditional Pizzas + 2 Garlic Breads + 2 x 1.25L Drinks", price: "9.99", day: "Today Only" },
{ name: "Value Range Pizzas", price: "11.95", day: "Last Day" },
{ name: "10 Chicken Pieces", price: "10.00", day: "2 Days Left", img: "/img/chicken.jpg" },
{ name: "Garlic Bread & 2 x 1.25L Coke", price: "7.95", day: "2 Days Left" },
{ name: "Any 3 Pizzas + 3 Sides", price: "31.95", day: "3 Days Left" },
{ name: "Garlic Bread", price: "2.00", day: "4 Days Left" },
{ name: "Honey Soy Chicken Bites", price: "5.95", day: "4 Days Left" },
{ name: "Traditional Value Range Pizzas", price: "9.99", day: "5 Days Left" },
{ name: "Chef's Best Pizzas", price: "9.99", day: "6 Days Left" },
{ name: "Traditional Value Range Pizzas", price: "9.99", day: "6 Days Left" },
{ name: "Chef's Best Pizzas", price: "9.99", day: "6 Days Left" },
{ name: "Traditional Value Range Pizzas", price: "9.99", day: "7 Days Left" },
{ name: "Chef's Best Pizzas", price: "9.99", day: "8 Days Left" },
{ name: "Traditional Value Range Pizzas", price: "9.99", day: "9 Days Left" }
]



get '/' do
  haml :index
end


get '/stylesheets/*.css' do
  content_type 'text/css', charset: 'utf-8'
  filename = params[:splat].first
  sass filename.to_sym, views: "#{settings.root}/assets/stylesheets"
end



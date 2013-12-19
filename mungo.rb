require 'sinatra'

get '/' do
  'This should eventually be a usage page'
end

get '/all' do
  all = (1..255).to_a
  all.map! { |x| x.chr }
  all = all.join
  "#{all}"
end

get '/:num/*' do |num, word|
  output = word * num.to_i
  "#{output}"
end


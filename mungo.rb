require 'sinatra'

get '/' do
  'This should eventually be a usage page'
end

get '/:num/*' do |num, word|
  output = word * num.to_i
  "#{output}"
end

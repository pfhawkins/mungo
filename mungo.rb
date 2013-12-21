require 'sinatra'
set :public_folder, Proc.new { File.join(root) }

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
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


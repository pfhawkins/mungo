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

get '/count/*' do |target|
  @target = target.to_i
  @pos = @target
  @text = ""
  @pip = "*"

  while true do
    if @text.length + @pos.to_s.length + 1 > @target
      if @target - @text.length == 0
        @text.reverse!
        break
      else
        @text.insert(-1, @pip)
        @text.reverse!
        break
      end
    else
      @text.insert(-1, @pip)
      insertion = @pos.to_s
      insertion.reverse!
      @text.insert(-1, insertion)
      @pos = @pos - @pos.to_s.length-1
    end
  end
  "#{@text}"
  
end

get '/:num/*' do |num, word|
  output = word * num.to_i
  "#{output}"
end


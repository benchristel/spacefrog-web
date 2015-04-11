require 'sinatra'
require_relative './complaint_form'
require_relative './main_layout'
require_relative './complainant'

set :public_folder, 'public'

get '/' do
  ComplaintForm.new(MainLayout.new).html
end

post '/' do
  puts params.inspect
  if ENV['LIVE_FIRE'] == 'true'
    puts "sending emails is ENABLED"
    HTTParty.post("http://www.flysfo.com/sites/all/themes/sfo/php/sendmail.php", params)
  else
    puts "sending emails is DISABLED"
  end
end

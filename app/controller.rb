require 'sinatra'
require 'typhoeus'
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
    Typhoeus.post("http://www.flysfo.com/sites/all/themes/sfo/php/sendmail.php", body: params)
  else
    puts "sending emails is DISABLED"
  end
end

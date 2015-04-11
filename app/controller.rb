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
  #HTTParty.post("http://www.flysfo.com/sites/all/themes/sfo/php/sendmail.php", params)
end

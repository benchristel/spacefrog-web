require 'sinatra'
require 'typhoeus'
require 'mongoid'
require_relative './complaint_form'
require_relative './complaint_index_view'
require_relative './main_layout'
require_relative './complaint'

puts "running in DEV" if development?
puts "running in PROD" if production?

set :public_folder, 'public'

configure do
  Mongoid.load!("./mongoid.yml")
end

get '/complaints' do
  return unless authenticated?(params)
  ComplaintIndexView.new(Complaint.all, MainLayout.new).html
end

get '/' do
  ComplaintForm.new(MainLayout.new).html
end

post '/' do
  begin
    Complaint.create(complainant_email: params['emailTo']) unless params['emailTo'] == 'sfo.noise@flysfo.com'
  rescue => e
    puts "could not log complaint: #{e.inspect}"
  end

  if ENV['LIVE_FIRE'] == 'true'
    puts "sending emails is ENABLED"
    Typhoeus.post("http://www.flysfo.com/sites/all/themes/sfo/php/sendmail.php", body: params)
  else
    puts "sending emails is DISABLED"
  end
end

def authenticated?(params)
  params['p'] == ENV['PASSWORD'] && ENV['PASSWORD'] != '' && ENV['PASSWORD'] != nil
end

require 'sinatra'
require 'typhoeus'
require 'mongoid'
require_relative './complaint_form'
require_relative './complaint_index_view'
require_relative './main_layout'
require_relative './complaint'
require_relative './report'
require_relative './session'

puts "running in DEV" if development?
puts "running in PROD" if production?

set :public_folder, 'public'

configure do
  Mongoid.load!("./mongoid.yml")
end

get '/complaints' do
  return unless authenticated?(headers)
  complaints = Complaint.where(:created_at.gt => 2.months.ago.beginning_of_month, :complainant_email.nin => email_blacklist)
  ComplaintIndexView.new(complaints, Report.new(complaints), MainLayout.new).html
end

get '/' do
  ComplaintForm.new(MainLayout.new).html
end

get '/sign_in' do
  MainLayout.new.wrap(
    '<form action="/sign_in" method="POST"><input type="password" name="password"><input type="submit" value="Sign In"></form>'
  )
end

post '/sign_in' do
  hour = 3600 #seconds
  if params['password'] == ENV['PASSWORD'] && ENV['PASSWORD'].to_s != ''
    Session.delete_all
    session = Session.create(token: SecureRandom.hex(128))
    headers['Set-Cookie'] = 'session_token=' + session.token
    redirect '/complaints'
  else
    redirect '/sign_in'
  end
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

def authenticated?(headers)
  cookie = env['HTTP_COOKIE'].to_s.split('=')[1]
  puts env.inspect
  puts env['HTTP_COOKIE'].inspect
  puts env['HTTP_COOKIE'].to_s.inspect
  puts env['HTTP_COOKIE'].to_s.split('=').inspect
  puts cookie.inspect
  puts Session.all.to_a.inspect
  return false if cookie.nil?
  Session.find_by(token: cookie) != nil
end

def email_blacklist
  ENV['BLACKLIST'].to_s.split(',')
end

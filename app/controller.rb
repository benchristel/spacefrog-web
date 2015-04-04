require 'sinatra'
require_relative './complaint_form'
require_relative './main_layout'
require_relative './complainant'

get '/' do
  ComplaintForm.new(MainLayout.new, Complainant.new(params)).html
end

class Complaint
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :complainant_email, type: String
end

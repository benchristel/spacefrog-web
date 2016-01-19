class Complaint
  include Mongoid::Document
  include Mongoid::Timestamps

  field :complainant_email, type: String

  index created_at: 1, complainant_email: 1
end

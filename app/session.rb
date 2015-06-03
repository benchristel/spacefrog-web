class Session
  include Mongoid::Document
  include Mongoid::Timestamps

  field :token, type: String
end

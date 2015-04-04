require 'spec_helper'

describe Complaint do
  subject { Complaint.new(complainant) }
  let(:complainant) { double first_name: 'Elias' }

  specify { expect(subject.complainant_first_name).to eq 'Elias' }
end

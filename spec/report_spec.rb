require_relative '../app/report'
require 'time'

describe Report do
  it 'reports the number of complaints and complainants by PDT month' do
    data = [
      double(complainant_email: 'alice', created_at: Time.parse('2015-05-01 00:01:00 PDT').utc),
      double(complainant_email: 'alice', created_at: Time.parse('2015-05-02 00:01:00 PDT').utc),
      double(complainant_email: 'bobbert', created_at: Time.parse('2015-05-03 00:01:00 PDT').utc),
      double(complainant_email: 'alice', created_at: Time.parse('2015-04-30 23:59:00 PDT').utc),
      double(complainant_email: 'alice', created_at: Time.parse('2015-04-30 23:59:00 PDT').utc)
    ]

    expect(Report.new(data).by_month).to eq(
      '2015-05' => {complaints: 3, complainants: 2},
      '2015-04' => {complaints: 2, complainants: 1}
    )
  end
end

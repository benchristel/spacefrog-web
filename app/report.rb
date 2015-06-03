require 'timezone'

class Time
  def pacific_time
    Timezones.pacific_time self
  end
end

class Timezones
  def self.pacific_time time
    @pacific_time ||= Timezone::Zone.new(:zone => 'America/Los_Angeles')
    @pacific_time.time time
  end
end

class Report
  def initialize(complaints)
    @complaints = complaints
  end

  def by_month
    Hash[complaints_by_month do |complaints|
      [ year_and_month_of(complaints),
        { complainants: submitters_of(complaints).count,
          complaints: complaints.count
        }
      ]
    end]
  end

  private

  def complaints_by_month
    @complaints
      .group_by { |complaint| complaint.created_at.pacific_time.month }
      .map { |_, complaints| yield complaints }
  end

  def year_and_month_of complaints
    complaints[0].created_at.pacific_time.strftime('%Y-%m')
  end

  def submitters_of complaints
    complaints.map(&:complainant_email).uniq
  end
end

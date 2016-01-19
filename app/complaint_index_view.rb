class ComplaintIndexView
  def initialize(complaints, report, layout)
    @complaints = complaints
    @report = report
    @layout = layout
  end

  def html
    content = ""

    content += "<h1>Summary</h1>"
    content += "<table><tr><td>Month</td><td>Complaints</td><td>Complainants</td></tr>"
    @report.by_month.each do |month, data|
      content += "<tr><td>#{month}</td><td>#{data[:complaints]}</td><td>#{data[:complainants]}</td></tr>"
    end
    content += "</table>"

    content += "<h1>Complaint History</h1>"
    if @complaints.size == 0
      content += "<p>there are no complaints to show.</p>"
    else
      content += "<table>#{@complaints[-1000 .. -1].map { |complaint| table_row complaint }.join()}</table>"
    end

    @layout.wrap content
  end

  private

  def table_row complaint
    "<tr><td>#{complaint.created_at}</td><td>#{complaint.complainant_email}</td></tr>"
  end
end

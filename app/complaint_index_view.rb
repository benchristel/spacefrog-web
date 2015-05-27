class ComplaintIndexView
  def initialize(complaints, layout)
    @complaints = complaints
    @layout = layout
  end

  def html
    if @complaints.size == 0
      @layout.wrap "<p>there are no complaints to show.</p>"
    else
      @layout.wrap "<table>#{@complaints.map { |complaint| table_row complaint }.join()}</table>"
    end
  end

  private

  def table_row complaint
    "<tr><td>#{complaint.created_at}</td><td>#{complaint.complainant_email}</td></tr>"
  end
end

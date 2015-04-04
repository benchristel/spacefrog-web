class ComplaintForm
  def initialize(layout, complainant)
    @layout = layout
    @complainant = complainant
  end

  def html
    @layout.wrap %^
<p>nothing here yet</p>

    ^
  end
end

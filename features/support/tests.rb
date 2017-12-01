class Tests
  def initialize(pages, filters)
    @pages = pages
    @filters = filters
  end

  def filters_test
    @filters_test ||= FilterTest.new(@pages, @filters)
    @filters_test
  end
end
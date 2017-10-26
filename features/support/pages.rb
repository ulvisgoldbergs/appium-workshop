class Pages
  def page_intro
    @page_intro ||= IntroPage.new
    @page_intro
  end
end
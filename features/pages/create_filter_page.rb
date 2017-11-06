class CreateFilterPage < BasePage
  def initialize
    @title = Element.new(:xpath, '//android.widget.TextView[contains(@text, "Izveidot filtru")]')
    @titles_category = Element.new(:id, 'main_row_background')
  end

  def visible?
    @title.visible?
    @titles_category.visible?
  end

  def open_category(name)
    @titles_category.click_by_text(name)
  end
end
class SubCategoryPage < BasePage
  def initialize
    @title = Element.new(:xpath, '//android.widget.TextView[contains(@text, "Transports")]')
    @sub_cat = ElementGroup.new(:id, 'category_name')
  end

  def visible?
    @title.visible?
    @sub_cat.visible?
  end

  def open_sub_category(name)
    @sub_cat.scroll_to_exact(name).click
  end
end
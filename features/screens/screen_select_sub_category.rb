class ScreenSelectSubCategory < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @rows = element(:id, 'category_name')
    @driver = driver
  end

  def visible?(title)
    @driver.wait { @driver.text(title).displayed? }
    @driver.wait do
      @driver.find_element(
        @rows[:type], @rows[:value]
      ).displayed?
    end
  end

  def select_sub_category(sub_name)
    visible = false
    @driver.find_elements(
      @rows[:type], @rows[:value]
    ).each do |row|
      next unless row.text == sub_name
      row.click
      visible = true
      break
    end
    @driver.scroll_to_exact(sub_name).click unless visible
  end
end

class ScreenCreateFilter < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @title = element(:text, 'Izveidot filtru')
    @rows = element(:id, 'main_row_text')
    @driver = driver
  end

  def visible?
    @driver.wait { @driver.text(@title[:value]).displayed? }
  end

  def select_row(category_name)
    @driver.find_elements(@rows[:type], @rows[:value]).each do |row|
      if row.text == category_name
        row.click
        break
      end
    end
  end
end

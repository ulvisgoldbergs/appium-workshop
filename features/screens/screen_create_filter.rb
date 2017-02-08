class ScreenCreateFilter < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @title = element(:text, 'Izveidot filtru')
    @rows = element(:id, 'main_row_text')
    @driver = driver
  end

  # Gaida kamer mekletais elements klust redzams (30 sek max by default)
  def visible?
    @driver.wait { @driver.text(@title[:value]).displayed? }
  end

  #Izvelas kategoriju no saraksta
  def select_row(category_name)
    #Parstaiga visu kategoriju sarakstu
    @driver.find_elements(@rows[:type], @rows[:value]).each do |row|
      #Ja kategoriju saraksta elements atbilst noraditajam elementam
      if row.text == category_name
        row.click
        break
      end
    end
  end
end

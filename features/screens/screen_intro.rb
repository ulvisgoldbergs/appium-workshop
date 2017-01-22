class ScreenIntro < ScreenBase
  attr_accessor :driver
  def initialize(driver)
    @base = element(:id, 'content')
    #this will check if button, that navigate user to main screen  exists. As there are multiple buttons on the screen, it is necessary to specify ID of this particular button, which is uniqe
    #@button_intro_close = element(:id, 'close_intro')
    #this will check if funnel image element exist in the screen. Funnel image has ImageView class, which is used by other elements, thats why element will be specified by ID
    @imageView_intro_footer_image = element(:id, 'intro_footer_image')
    #this will check if page image element exist in the screen. PAge image has ImageView class, which is used by other elements, thats why element will be specified by ID
    @imageView_page_image = element(:id, 'page_image')
    #Check will be done by ID, because checking by text can cause problems, as the text might be changed in future, or translated
    @textView_intro_text_header = element(:id, 'intro_text_header')
    #Check will be done by ID, because checking by text can cause problems, as the text might be changed in future, or translated
    @textView_intro_text_footer = element(:id, 'intro_text_footer')
    @button_to_app = element(:id, 'close_intro')
    @driver = driver
  end

  def visible?
    #@driver.alert_accept
    #@driver.find_element(@base[:type], @base[:value])
    #@driver.find_element(@button_intro_close[:type], @button_intro_close[:value])
    #@driver.find_element(@imageView_intro_footer_image[:type], @imageView_intro_footer_image[:value])
    #@driver.find_element(@imageView_page_image[:type], @imageView_page_image[:value])
    #@driver.find_element(@textView_intro_text_header[:type], @textView_intro_text_header[:value])
    #@driver.find_element(@textView_intro_text_footer[:type], @textView_intro_text_footer[:value])
  end

  def close_intro
    @driver.find_element(@button_to_app[:type], @button_to_app[:value]).click
  end
end

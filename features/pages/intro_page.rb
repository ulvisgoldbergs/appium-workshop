class IntroPage < BasePage
  def initialize
    @button_close_intro = Element.new(:id, 'close_intro')
    @button_close_alert_ok = Element.new(:xpath, '//android.widget.Button[contains(@text, "OK")]')
  end

  def visible?
    @button_close_intro.visible?
  end

  def close_intro_if_visible
    self.alert_accept
    if @button_close_intro.any?
      @button_close_intro.click
    end
    if @button_close_alert_ok.any?
      self.alert_accept
    end
  end
end
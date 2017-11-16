class FilterTest
  def initialize(pages)
    @pages = pages
  end

  def close_intro
    @pages.page_intro.close_intro_if_visible
    @pages.page_create_filter.visible?
  end

  def open_filter_params
    @pages.page_create_filter.open_category("Transports")
    sub_cats = ["Vieglie auto", "Audi", "Audi A1", "Visi"]
    sub_cats.each do |sub_cat|
      @pages.page_sub_category.open_sub_category(sub_cat)
    end
    @pages.page_paremeters.visible?
  end

  def set_filter_params
    @pages.page_paremeters.set_name("Test Name")
    @pages.page_paremeters.set_parameter("GADS", "1999", "2002")
  end

  def submit_filter
    set_filter_params
    @pages.page_paremeters.save_filter
  end
end
#Pieprasa failu, kur ir nodefineta filtra klase
require_relative '../config/filters'
class TestAddFilter

  attr_accessor :driver

  def initialize(screens)
    @screens = screens
  end

  def choose_filter(filter_name)
    @filter_data = Filter.new(filter_name)
  end

  #izvelas kadu no kategorijam Nekust ip, Auto, vakances
  def select_category
    #Parbauda vai ekrans ir redzams
    @screens.screen_create_filter.visible?
    #Pievieno kategoriju no filtra datiem
    @screens.screen_create_filter.select_row(@filter_data.category)
  end

  def select_sub_category(sub_cat_hash)
    #Parbauda vai konkreta subkategorija ir redzama
    @screens.screen_select_sub_category.visible?(sub_cat_hash['title'])
    #Izvelas padoto kategoriju
    @screens.screen_select_sub_category.select_sub_category(sub_cat_hash['option'])
  end

  def open_filter_parameter_screen
    select_category
    @filter_data.sub_categories.each do |sub_category|
      select_sub_category(sub_category)
    end
  end

  #Uzstadis filtra nosaukumu
  def set_filter_name
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.set_name(@filter_data.name)
  end

  #Uzseto visus parametrus filtram. Iziet cauri failam un ieraksta info filtra logos
  def set_all_parameters
    @screens.screen_set_filter_parameters.visible?
    @filter_data.parameters.each do |parameter|
      #ieraksta datus laukos
      @screens.screen_set_filter_parameters.set_parameter(parameter)
    end
  end

  #Nospiez pogu Save
  def submit_filter_data
    set_filter_name
    set_all_parameters
    @screens.screen_set_filter_parameters.save_filter
  end

  def submit_empty_filter_parameters
    @screens.screen_set_filter_parameters.visible?
    @screens.screen_set_filter_parameters.save_filter
  end

  def create_filter
    open_filter_parameter_screen
    submit_filter_data
  end

end

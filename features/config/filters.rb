#ielade yaml biblioteku, laujot sij koda dalai izmantot informaciju no yaml failiem
require 'yaml'
class Filter
  attr_accessor :name, :category, :sub_categories, :parameters

  #Funkcija, nolasa infomaciju no yaml faila
  def initialize(type)
    config = YAML.load_file('features/config/filters.yml')[type]
    @name = config['name']
    @category = config['category']
    @sub_categories = []
    #parstaiga un ievieto masiva categories dalu no yaml faila
    config['sub_categories'].each do |sub_cat|
      @sub_categories.push sub_cat
    end
    @parameters = []
    #parstaiga un ievieto masiva parameters dalu no yaml faila
    config['parameters'].each do |parameter|
      @parameters.push parameter
    end
  end

  # Funkcija, kas izvada konsoles loga faila saturu
  def print_properties
    print 'Name:' + @name
    print "\nCategory:" + @category
    print "\nSub Categories:"
    @sub_categories.each do |sub_cat|
      print "\n\t - " + sub_cat['title'] + ' ' + sub_cat['option']
    end
    print "\nParameters:"
    @parameters.each do |parameter|
      print "\n\t - " + parameter['name'] + ' ' + parameter['left'] + ' ' + parameter['right']
    end
    print "\n\n"
  end
end
filter = Filter.new('property_positive')

filter.print_properties

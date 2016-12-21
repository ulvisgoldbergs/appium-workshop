class Users
  def initialize(type)
    @type = type
    config = YAML.load_file('features/config/users.yml')
    @activation = config[@type]['activation']
    @code = config[@type]['code']
    @interests = config[@type]['interests']
    @updates = config[@type]['updates']
  end
  attr_accessor :activation, :code, :interests, :updates
end

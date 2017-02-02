require_relative 'adb'
class RunnerAndroid

  def initialize(device, options)
  @options = options
  @device = device
  @device_name = Adb.device_name(@device)
  end

  def run
    command = "export curdevice=#{@device} ; " \
    "export apk=#{@options['apk']} ; " \
    "export port=#{@options['port']} ; " \
    "export boot_port=#{@options['boot_port']} ; " \
    "cucumber --tags #{@options['tags']} -f --format #{@options['report']} " \
    "-o reports/#{@device_name}.#{@options['report']}"
    p command
  end
end

temp = RunnerAndroid.new('00bbb8a0ec4f9f25', {'apk' => 'apk', 'port' => '32432', 'boot_port' => '45533', 'tags' => '@tags', 'report' => 'report'})
temp.run

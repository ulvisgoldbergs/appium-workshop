require_relative 'runner_android'
require_relative 'adb'
require 'yaml'

class ParallelRunner

  def initialize
    all_devices
    @config = YAML.load_file('/home/automation/Automation/appium-workshop/features/config/devices.yml')
    @devices_connected = []
    test_devices
  end


  def all_devices
    @adb_devices_connected = Adb.connected_devices
    puts 'All connected devices:' + @adb_devices_connected.to_s
  end

  def test_devices
    @config['devices'].each do |device|
      @devices_connected.push(device) if @adb_devices_connected.include?(device)
    end
    puts 'Devices where tests will be executed:' + @devices_connected.to_s
  end

  def run_parallel

  end

  def wait_for_tests

  end
end

temp = ParallelRunner.new

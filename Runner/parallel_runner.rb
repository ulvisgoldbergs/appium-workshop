require_relative 'android_runner'
require_relative 'adb'
require 'yaml'

class ParallelRunner
  def initialize(options)
    @options = options
    all_devices
    @port = 4000
    @boot_port = 5000
    @threads = []
    @port_counter = 0
  end


  def all_devices
    @adb_devices_connected = Adb.connected_devices
    puts 'All connected devices:' + @adb_devices_connected.to_s
  end

  def run_parallel
    # $run_tests_on_next_device = true
    @adb_devices_connected.each do |device|
      # $run_tests_on_next_device = false
      @port += 1
      @boot_port += 1
      @options['device_name'] = Adb.device_name(device)
      @options['boot_port'] = @boot_port
      @options['port'] = @port
      runner_obj = AndroidRunner.new(device,@options)
      @threads << Thread.new do
        runner_obj.run
      end
    end
  end

  def wait_for_tests
    @threads.each(&:join)
  end
end
require_relative 'android_runner'
require_relative 'adb'
class ParallelRunner
  def initialize(options)
    @options = options
    @port = 4000
    @boot_port = 5000
    @threads = []
  end

  def run_parallel
    # device = "33009158a0b3b3c3"
    device_list = Adb.connected_devices
    p 'All Connected devices:' + device_list.to_s
    device_list.each do |device|
      temp_options = @options
      @port += 1
      @boot_port += 1
      temp_options['device_name'] = Adb.device_name device
      temp_options['boot_port'] = @boot_port
      temp_options['port'] = @port
      temp = AndroidRunner.new(device,
                               temp_options)
      @threads << Thread.new do
        temp.run
      end
    end
  end

  def wait_for_all_tests
    @threads.each(&:join)
  end
end

#  run = ParallelRunner.new({'apk' => 'app.apk', 'report' => 'html'})
#
# run.run_parallel
# run.wait_for_all_tests
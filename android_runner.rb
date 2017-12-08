class AndroidRunner
  def initialize(sn, options)
    @sn = sn
    @options = options
  end

  def run
    command = "export sn=#{@sn} ; " \
    "export boot_port=#{@options['boot_port']} ; " \
    "export port=#{@options['port']} ; " \
    "export apk=#{@options['apk']} ; " \
    "cucumber -f pretty -f #{@options['report']} " \
    "-o reports/#{@options['device_name']}.#{@options['report']}"

    p command
    `#{command}`
  end
end

temp = AndroidRunner.new("BYJDU17511001133",
                       {'boot_port' => 5000, 'port' => 4000, 'apk' => 'app.apk', 'report' => 'html', 'device_name' => 'huawe'})

temp.run
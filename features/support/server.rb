class Server
  def initialize(options)
    @port = options['port']
    @port_boot = options['portboot']
    @sn = options['sn']
    @apk = options['app']
    @app_package = options['appPackage']
  end

  def start
    stop
    `appium -p #{@port} -bp #{@port_boot} -U #{@sn} >> logs.log 2>&1 &`
  end

  def stop
    lines = `ps ax | grep #{@sn} | grep node`.split("\n")
    lines.each do |line|
      pid = line.split(' ').first
      `kill -9 #{pid}`
    end
  end

  def uninstall_app
    `adb -s #{@sn} uninstall io.appium.settings`
    `adb -s #{@sn} uninstall io.appium.unlock`
    `adb -s #{@sn} uninstall #{@app_package}`
  end

  def install_app
    `adb -s #{@sn} install #{@apk}`
  end

  def reinstall_app
    uninstall_app
    install_app
  end
end

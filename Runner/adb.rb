class Adb
  def self.device_name(sn)
    device_name = ''
    brand = "adb -s #{sn} shell getprop ro.product.brand"
    model = "adb -s #{sn} shell getprop ro.product.model"
    temp_name = `#{brand}` + '_' + `#{model}`
    device_name = temp_name.to_s.delete("\r").delete("\n").sub(' ', '_').sub('-', '_').sub('.', '_').sub(',', '_')
  end

  def self.connected_devices
    adb_device = `adb devices`
    adb_device.tr!("\t", "\n")
    adb_device = adb_device.split("\n")
    adb_device = adb_device.delete_if {|x| x == 'List of devices attached'}
    adb_device = adb_device.delete_if {|x| x == 'device'}
    adb_device = adb_device.delete_if {|x| x == 'unatorized'}
    adb_device = adb_device.delete_if {|x| x == 'offline'}
    adb_device
  end
end
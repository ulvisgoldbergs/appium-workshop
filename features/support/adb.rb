class Adb
  def self.device_name(sn)
    device_name = ''
    device_name = device_name + `adb -s #{sn} \
    shell getprop ro.product.brand` + '_' + `adb -s #{sn} \
    shell getprop ro.product.model`.to_s
    device_name = device_name.to_s.delete("\r").delete("\n").tr(' ', '_')
                             .sub(' ', '_').sub('-', '_').sub('.', '_')
                             .sub('.', '_')
    device_name
  end

  def self.connected_devices
    adb_devices = `adb devices`
    adb_devices.tr!("\t", "\n")
    adb_devices = adb_devices.split("\n")
    adb_devices = adb_devices.delete_if { |x| x == 'List of devices attached' }
    adb_devices = adb_devices.delete_if { |x| x == 'device' }
    adb_devices = adb_devices.delete_if { |x| x == 'unatorized' }
    adb_devices = adb_devices.delete_if { |x| x == 'offline' }
    adb_devices
  end
end

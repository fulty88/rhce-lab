Vagrant.configure("2") do |config|

  config.vm.box = "generic/rhel9"

  # -------------------------
  # ansible controller
  # -------------------------
  config.vm.define "ansible-controller" do |c|
    c.vm.hostname = "ansible-controller"
    c.vm.network "private_network", ip: "192.168.142.135"

    c.vm.provider "vmware_desktop" do |v|
      v.vmx["memsize"] = "2048"
      v.vmx["numvcpus"] = "2"
    end
  end

  # -------------------------
  # ansible1
  # -------------------------
  config.vm.define "ansible1" do |c|
    c.vm.hostname = "ansible1"
    c.vm.network "private_network", ip: "192.168.142.136"

    c.vm.provider "vmware_desktop" do |v|
      v.vmx["memsize"] = "1024"
      v.vmx["numvcpus"] = "1"
    end
  end

  # -------------------------
  # ansible2
  # -------------------------
  config.vm.define "ansible2" do |c|
    c.vm.hostname = "ansible2"
    c.vm.network "private_network", ip: "192.168.142.137"

    c.vm.provider "vmware_desktop" do |v|
      v.vmx["memsize"] = "1024"
      v.vmx["numvcpus"] = "1"
    end
  end

end
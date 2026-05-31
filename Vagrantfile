Vagrant.configure("2") do |config|

  config.vm.box = "generic/rhel9"

  # ==========================================
  # GLOBAL PROVISIONING (Points to external script)
  # ==========================================
  config.vm.provision "shell", 
    path: "setup.sh",
    env: {
    "RHSM_USER" => ENV["RHSM_USER"],
    "RHSM_PASS" => ENV["RHSM_PASS"]
  }

  config.trigger.before :destroy do |t|
    t.info = "Unregistering RHEL subscription before VM destruction"

    t.run_remote = {
      inline: <<-BASH
        sudo subscription-manager unregister || true
        sudo subscription-manager clean || true
      BASH
    }
  end

  # -------------------------
  # control node
  # -------------------------
  config.vm.define "control" do |c|
    c.vm.hostname = "control"
    c.vm.network "private_network", ip: "192.168.243.135"
    c.vm.provider "vmware_desktop" do |v|
      v.vmx["memsize"] = "4096"
      v.vmx["numvcpus"] = "2"
    end
  end

  # -------------------------
  # node1
  # -------------------------
  config.vm.define "node1" do |c|
    c.vm.hostname = "node1"
    c.vm.network "private_network", ip: "192.168.243.136"
    c.vm.provider "vmware_desktop" do |v|
      v.vmx["memsize"] = "1024"
      v.vmx["numvcpus"] = "1"

      # Add a second disk
      #v.vmx["sata0.present"] = "TRUE"
      #v.vmx["sata0:1.present"] = "TRUE"
      #v.vmx["sata0:1.fileName"] = "C:/vm-disks/rhce/disk2.vmdk"
      #v.vmx["sata0:1.deviceType"] = "disk"
    end
  end

  # -------------------------
  # node2
  # -------------------------
  config.vm.define "node2" do |c|
    c.vm.hostname = "node2"
    c.vm.network "private_network", ip: "192.168.243.137"
    # Additional interface
    c.vm.network "private_network", ip: "192.168.243.140"
    c.vm.provider "vmware_desktop" do |v|
      v.vmx["memsize"] = "1024"
      v.vmx["numvcpus"] = "1"

    end
  end

  # -------------------------
  # node3
  # -------------------------
  config.vm.define "node3" do |c|
    c.vm.hostname = "node3"
    c.vm.network "private_network", ip: "192.168.243.138"
    c.vm.provider "vmware_desktop" do |v|
      v.vmx["memsize"] = "1024"
      v.vmx["numvcpus"] = "1"

    end
  end

  # -------------------------
  # node4
  # -------------------------
  config.vm.define "node4" do |c|
    c.vm.hostname = "node4"
    c.vm.network "private_network", ip: "192.168.243.139"
    c.vm.provider "vmware_desktop" do |v|
      v.vmx["memsize"] = "1024"
      v.vmx["numvcpus"] = "1"

    end
  end

end
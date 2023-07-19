HOSTNAME = "ubuntu"
MEMORY = 8192
CPUS = 2
DISK_SIZE = "40GB" # Why not 20? requermrnt for Ubuntu 22.04 = 25 GB. 
PUB_KEY = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCv+KnwuDeGTObMiuEpMW1En9kB8pR+vVKifXKantBrd76C+tUNAaqDqHWhoMOeiPLHh2XmLbhvLyrO/1bFmHDcNuSFTehqvHo9B+wStqcUqcv9ORyOyXQQWwk8SGo5GOh4HhGQg2WU4q6jUhdELjebrkY74XdmGfle0bGtTSCvZ/i8+Yy9YdkI7B96COoZ72zlIVvbcXhTO8n8iVAvEC7X54toJMybRpU216bNLkwhPlUEh6bLl0jFcdnSUmX+GRGdZtqDsf8UHIAfzEj50YmMB5ZNA0XBdgzxiVM44Eq4TuDi2EmifgL5naEpxAq7P9d9spKAkSvRvvepQUkAAoJw8NouclNBrGO6WkU6sgbyxqdINM+lY90rJt9pyOHBz6QeDt4IGTk3uf5MUfzKMaJAMPJ+ZdPPwtSGA4muRl+BnY1XhYYre2ttMe2orVL0Y431mMPqDffg+hUj8idGy4rWHauKnwEuMYoyAi1CQj/u5Jq9a959OAlCPb5FA0XOZdk= mrak@TF-584707042929"
#VALUE = 360

# Create VM latest Ubuntu LTS image (Ubuntu 22.04 LTS) + openssh
# -----------------------------------------------------------------------------
Vagrant.configure("2") do |config|
    config.vagrant.plugins = ["vagrant-disksize"]
    config.vm.box = "ubuntu/jammy64"
    config.vm.hostname = HOSTNAME
    config.disksize.size = DISK_SIZE
    config.vm.network :private_network, ip: "10.0.0.4"
    config.vm.provider "virtualbox" do |v|
        v.name = "my_test_vm_Ubuntu"
        v.memory = MEMORY
        v.cpus = CPUS            
      end
#    config.vm.boot_timeout = VALUE


# Configure envarement: update, check openssh, add user "thermo" with ssh key
# -----------------------------------------------------------------------------
    config.vm.provision "shell", path: "script.sh"
    config.vm.provision "shell" do |s|
      ssh_pub_key = PUB_KEY
# or choose path to id_rsa.pub      
#     ssh_pub_key = File.readlines("#{Dir.home}/.ssh/test/id_rsa.pub").first.strip
      s.inline = <<-SHELL
        echo #{ssh_pub_key} >> /home/thermo/.ssh/authorized_keys
      SHELL
    end


# Install docker on the VM and run the latest postgresql
# -----------------------------------------------------------------------------
    config.vm.provision "docker" do |d|
      d.run "postgres:latest",
        args: "-p '5432:5432' -e 'POSTGRES_PASSWORD=mysecretpassword' -d ",
        restart: "always"
    end
    config.vm.provision "shell", inline: "sudo usermod -aG docker thermo"      
end 


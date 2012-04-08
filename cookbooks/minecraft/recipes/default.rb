minecraft_directory = '/mnt/data_minecraft'

directory minecraft_directory do
  owner 'ubuntu'
  group 'ubuntu'
  mode '0755'
end

#mount '/mnt/data_minecraft' do
  #action [:mount, :enable]  # mount and add to fstab
  #device 'data_minecraft'
  #device_type :label
  #options 'noatime,errors=remount-ro'
#end

remote_file "#{minecraft_directory}/minecraft_server.jar" do
  source "http://www.minecraft.net/download/minecraft_server.jar"
  mode "0644"
end

cookbook_file "#{minecraft_directory}/minecraft.sh" do
  source 'minecraft.sh'
  owner  'ubuntu'
  group  'ubuntu'
  mode "0744"
end

cookbook_file "#{minecraft_directory}/server.properties" do
  source 'server.properties'
  owner  'ubuntu'
  group  'ubuntu'
end

cookbook_file "/etc/rc.local" do
  source 'rc.local'
  owner  'ubuntu'
  group  'ubuntu'
  mode "0755"
end

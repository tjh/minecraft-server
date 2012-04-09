minecraft_directory = '/mnt/data_minecraft'
backup_directory = '/mnt/backup_minecraft'

[minecraft_directory, backup_directory].each do |folder|
  directory folder do
    owner 'ubuntu'
    group 'ubuntu'
    mode '0755'
  end
end

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

%w{ops.txt white-list.txt server.properties}.each do |filename|
  cookbook_file "#{minecraft_directory}/#{filename}" do
    source filename
    owner  'ubuntu'
    group  'ubuntu'
  end
end

cookbook_file "/etc/init.d/minecraft" do
  source 'minecraft'
  owner  'ubuntu'
  group  'ubuntu'
  mode "0755"
end

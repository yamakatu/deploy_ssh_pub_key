

if node['owner'] == 'root'
  home_dir = '/root/'
else
  home_dir = '/home/'+node['owner']+'/'
end

remote_directory home_dir << ".ssh/" do
  source "ssh"
  mode 0600
  owner node['owner']
  group node['owner']
end

cookbook_file home_dir << ".ssh/authorized_keys" do
  source "ssh/authorized_keys"
  mode 0600
  owner node['owner']
  group node['owner']
end


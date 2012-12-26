# Author:: yamakatu(yamakatun@hotmail.co.jp)
#
# Copyright 2012 yamakatu
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if node['owner'] == 'root'
  home_dir = '/root/'
else
  home_dir = '/home/'+node['owner']+'/'
end

remote_directory home_dir + ".ssh/" do
  source "ssh"
  mode 0600
  owner node['owner']
  group node['owner']
end

cookbook_file home_dir + ".ssh/authorized_keys" do
  source "ssh/authorized_keys"
  mode 0600
  owner node['owner']
  group node['owner']
end
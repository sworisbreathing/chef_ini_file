#
# Author: Steven Swor <sworisbreathing@gmail.com>
# Copyright (c) 2015, Steven Swor <sworisbreathing@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
require 'chef/resource/lwrp_base'

class Chef
  class Resource
    # Resource for managing ini file contents.
    class IniFile < Chef::Resource::LWRPBase
      self.resource_name = 'ini_file'

      attribute :path, kind_of: String, name_attribute: true

      attribute :atomic_update, kind_of: [TrueClass, FalseClass]
      attribute :backup, kind_of: [FalseClass, Integer]
      attribute :group, kind_of: [String, Integer]

      actions :create, :create_if_missing, :delete, :nothing, :touch
      default_action :create
    end
  end
end

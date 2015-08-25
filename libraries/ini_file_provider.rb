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
require 'chef/provider/lwrp_base'

class Chef
  class Provider
    # Provider for ini_file resource.
    class IniFile < Chef::Provider::LWRPBase
      provides :ini_file

      use_inline_resources if defined?(:use_inline_resources)

      def whyrun_supported?
        true
      end

      [
        :create,
        :delete,
        :create_if_missing,
        :touch
      ].each do |ackshun|
        action ackshun do
          file new_resource.path do
            action ackshun
            atomic_update new_resource.atomic_update unless new_resource.atomic_update.nil?
            backup new_resource.backup unless new_resource.backup.nil?
            group new_resource.group unless new_resource.group.nil?
            inherits new_resource.inherits unless new_resource.inherits.nil?
            mode new_resource.mode unless new_resource.mode.nil?
            owner new_resource.owner unless new_resource.owner.nil?
          end
        end
      end
    end
  end
end

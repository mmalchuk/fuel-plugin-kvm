#    Copyright 2017 Tinkoff, JSC.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.

class plugin_kvm::tasks::kvm {

  $network_metadata          = hiera_hash('network_metadata')
  $kvm_hiera_values          = hiera_hash('fuel-plugin-kvm')

  $kvm_nodes_array           = get_nodes_hash_by_roles($network_metadata, ['kvm-host'])

  class { '::libvirt':
    defaultnetwork     => true,
    virtinst           => false,
    unix_sock_group    => 'wheel',
    unix_sock_rw_perms => '0770',
  }

}

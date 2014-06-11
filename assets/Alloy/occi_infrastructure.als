module occi_infrastructure

open occi_core

sig Network extends Resource {
  occi_network_vlan: lone Int,
  occi_network_label: lone String,
  occi_network_state: one String
} {
  hasKind[network]
} 

one sig network extends Kind {} {
  term="network"
  scheme="http://schemas.ogf.org/occi/infrastructure#"
  title="Network type" 
  attributes = occi_network_vlan + occi_network_label + occi_network_state
  actions = occi_network_up + occi_network_down
  parent = resource
  entities in Network
}
one sig occi_network_vlan extends Attribute {} {
  name = "occi.network.vlan"
  type = "integer 0-4096"
  mutable = true
  required = false
  no default
  no description
}
one sig occi_network_label extends Attribute {} {
  name = "occi.network.label"
  type = "Token"
  mutable = true
  required = false
  no default
  no description
}
one sig occi_network_state extends Attribute {} {
  name = "occi.network.state"
  type = "enum {active, inactive}"
  mutable = false
  required = true
  no default
  no description
}

one sig occi_network_up extends Action {} {
  term="up"
  scheme="http://schemas.ogf.org/occi/infrastructure/network/action#"
  no title
  no attributes
}
one sig occi_network_down extends Action {} {
  term="down"
  scheme="http://schemas.ogf.org/occi/infrastructure/network/action#"
  no title
  no attributes
}

sig Compute extends Resource {
  occi_compute_architecture: lone String,
  occi_compute_cores: lone Int,
  occi_compute_hostname: lone String,
  occi_compute_speed: lone String,
  occi_compute_memory: lone String,
  occi_compute_state: one String
} {
  hasKind[compute]
} 

one sig compute extends Kind {} {
  term="compute"
  scheme="http://schemas.ogf.org/occi/infrastructure#"
  title="Compute Resource"
  attributes = occi_compute_architecture + occi_compute_cores + occi_compute_hostname + occi_compute_speed + occi_compute_memory + occi_compute_state
  actions = occi_compute_start + occi_compute_stop + occi_compute_restart + occi_compute_suspend
  parent = resource
  entities in Compute
}
one sig occi_compute_architecture extends Attribute {} {
  name = "occi.compute.architecture"
  type = "string"
  mutable = true
  required = false
  no default
  description = "CPU Architecture"
}
one sig occi_compute_cores extends Attribute {} {
  name = "occi.compute.cores"
  type = "integer"
  mutable = true
  required = false
  no default
  description = "CPU cores number"
}
one sig occi_compute_hostname extends Attribute {} {
  name = "occi.compute.hostname"
  type = "string"
  mutable = true
  required = false
  no default
  description = "System hostname"
}
one sig occi_compute_speed extends Attribute {} {
  name = "occi.compute.speed"
  type = "float"
  mutable = true
  required = false
  no default
  description = "CPU speed (GHz)"
}
one sig occi_compute_memory extends Attribute {} {
  name = "occi.compute.memory"
  type = "float"
  mutable = true
  required = false
  no default
  description = "System RAM (GB)"
}
one sig occi_compute_state extends Attribute {} {
  name = "occi.compute.state"
  type = "string"
  mutable = false
  required = true
  default = "inactive"
  description = "System state"
}

one sig occi_compute_start extends Action {} {
  term="start"
  scheme="http://schemas.ogf.org/occi/infrastructure/compute/action#"
  title = "Start the system"
  no attributes
}
one sig occi_compute_stop extends Action {} {
  term="stop"
  scheme="http://schemas.ogf.org/occi/infrastructure/compute/action#"
  title = "Stop the system (graceful, acpioff or poweroff)"
  attributes = occi_compute_stop_method
}
one sig occi_compute_stop_method extends Attribute {} {
  name = "method"
  type = "string"
  mutable = false
  required = false
  no default
  no description
}
one sig occi_compute_restart extends Action {} {
  term="restart"
  scheme="http://schemas.ogf.org/occi/infrastructure/compute/action#"
  title = "Restart the system (graceful, warm or cold)"
  attributes = occi_compute_restart_method
}
one sig occi_compute_restart_method extends Attribute {} {
  name = "method"
  type = "string"
  mutable = false
  required = false
  no default
  no description
}
one sig occi_compute_suspend extends Action {} {
  term="suspend"
  scheme="http://schemas.ogf.org/occi/infrastructure/compute/action#"
  title = "Suspend the system (hibernate or in RAM)"
  attributes = occi_compute_suspend_method
}
one sig occi_compute_suspend_method extends Attribute {} {
  name = "method"
  type = "string"
  mutable = false
  required = false
  no default
  no description
}

sig Storage extends Resource {
  occi_storage_size: one String,
  occi_storage_state: one String
} {
  hasKind[storage]
} 

one sig storage extends Kind {} {
  term="storage"
  scheme="http://schemas.ogf.org/occi/infrastructure#"
  title="Storage Resource" 
  attributes = occi_storage_size + occi_storage_state
  actions = occi_storage_online + occi_storage_offline + occi_storage_backup + occi_storage_snapshot + occi_storage_resize
  parent = resource
  entities in Storage
}
one sig occi_storage_size extends Attribute {} {
  name = "occi.storage.size"
  type = "float"
  mutable = true
  required = true
  no default
  description = "Storage size"
}
one sig occi_storage_state extends Attribute {} {
  name = "occi.storage.state"
  type = "string"
  mutable = true
  required = true
  no default
  description = "Storage state"
}

one sig occi_storage_online extends Action {} {
  term="online"
  scheme="http://schemas.ogf.org/occi/infrastructure/storage/action#"
  title = "Set storage online"
  no attributes
}
one sig occi_storage_offline extends Action {} {
  term="offline"
  scheme="http://schemas.ogf.org/occi/infrastructure/storage/action#"
  title = "Set storage offline"
  no attributes
}
one sig occi_storage_backup extends Action {} {
  term="backup"
  scheme="http://schemas.ogf.org/occi/infrastructure/storage/action#"
  title = "Set storage as backup"
  no attributes
}
one sig occi_storage_snapshot extends Action {} {
  term="snapshot"
  scheme="http://schemas.ogf.org/occi/infrastructure/storage/action#"
  title = "Take storage snapshot"
  no attributes
}
one sig occi_storage_resize extends Action {} {
  term="resize"
  scheme="http://schemas.ogf.org/occi/infrastructure/storage/action#"
  title = "Resize storage"
  attributes = occi_storage_resize_size
}
one sig occi_storage_resize_size extends Attribute {} {
  name = "size"
  type = "float"
  mutable = false
  required = false
  no default
  no description
}

sig StorageLink extends Link {
  occi_storagelink_deviceid: one String,
  occi_storagelink_mountpoint: lone String,
  occi_storagelink_state: one String
} {
  source in Compute
  target in Storage
  hasKind[storagelink]
}

one sig storagelink extends Kind {} {
  term="storagelink" 
  scheme="http://schemas.ogf.org/occi/infrastructure#"
  title="StorageLink Link"
  attributes = occi_storagelink_deviceid + occi_storagelink_mountpoint + occi_storagelink_state
  no actions
  parent = link
  entities in StorageLink
}
one sig occi_storagelink_deviceid extends Attribute {} {
  name = "occi.storagelink.deviceid"
  type = "string"
  mutable = true
  required = true
  no default
  no description
}
one sig occi_storagelink_mountpoint extends Attribute {} {
  name = "occi.storagelink.mountpoint"
  type = "string"
  mutable = true
  required = false
  no default
  no description
}
one sig occi_storagelink_state extends Attribute {} {
  name = "occi.storagelink.state"
  type = "string"
  mutable = false
  required = true
  no default
  no description
}

sig NetworkInterface extends Link {
  occi_networkinterface_interface: one String,
  occi_networkinterface_mac: one String,
  occi_networkinterface_state: one String
} {
  source in Compute
  target in Network
  hasKind[networkinterface]
}

one sig networkinterface extends Kind {} {
  term="networkinterface"
  scheme="http://schemas.ogf.org/occi/infrastructure#"
  title="NetworkInterface type"
  attributes = occi_networkinterface_interface + occi_networkinterface_mac + occi_networkinterface_state
  no actions
  parent = link
  entities in NetworkInterface
}
one sig occi_networkinterface_interface extends Attribute {} {
  name = "occi.networkinterface.interface"
  type = "string"
  mutable = false
  required = true
  no default
  no description
}
one sig occi_networkinterface_mac extends Attribute {} {
  name = "occi.networkinterface.mac"
  type = "string"
  mutable = true
  required = true
  no default
  no description
}
one sig occi_networkinterface_state extends Attribute {} {
  name = "occi.networkinterface.state"
  type = "enum {active, inactive}"
  mutable = false
  required = true
  no default
  no description
}

sig IpNetwork in Network {
  occi_network_address: lone String,
  occi_network_gateway: lone String,
  occi_network_allocation: one String
} {
}

one sig ipnetwork extends Mixin {} {
  term="ipnetwork"
  scheme="http://schemas.ogf.org/occi/infrastructure/network#"
  title="IP Networking Mixin"
  applies=network
  no depends
  attributes = occi_network_address + occi_network_gateway + occi_network_allocation
  no actions
  entities in IpNetwork
}
one sig occi_network_address extends Attribute {} {
  name = "occi.network.address"
  type = "string"
  mutable = true
  required = false
  no default
  no description
}
one sig occi_network_gateway extends Attribute {} {
  name = "occi.network.gateway"
  type = "string"
  mutable = true
  required = false
  no default
  no description
}
one sig occi_network_allocation extends Attribute {} {
  name = "occi.network.allocation"
  type = "string"
  mutable = true
  required = true
  no default
  no description
}

sig OS_TPL in Compute {
} {
}

one sig os_tpl extends Mixin {} {
  term="os_tpl"
  scheme="http://schemas.ogf.org/occi/infrastructure#"
  title="OS Template"
  applies=compute
  no depends
  no  attributes
  no actions
  entities in OS_TPL
}

sig Resource_TPL in Resource {
} {
}

one sig resource_tpl extends Mixin {} {
  term="resource_tpl"
  scheme="http://schemas.ogf.org/occi/infrastructure#" 
  title="Resource template"
  applies=resource
  no depends
  no  attributes
  no actions
  entities in Resource_TPL
}

run Consistency {} for 10

run The_OCCI_Type_System {} for 0

run an_OCCI_Infrastructure_instance {
  one c1, c2 : Compute, n1 : Network, s1 : Storage {
    c1.kind = compute and c1.id = "compute-1" and  c1.occi_compute_architecture = "x86" and c1.occi_compute_cores = 1 and  c1.occi_compute_hostname = "c1" and c1.occi_compute_speed = "1" and c1.occi_compute_memory = "4" and c1.occi_compute_state = "active"
    c2.kind = compute and c2.id = "compute-2" and  c2.occi_compute_architecture = "arm" and c2.occi_compute_cores = 4 and  c2.occi_compute_hostname = "c2" and c2.occi_compute_speed = "16Ghz" and c2.occi_compute_memory = "48Mb" and c2.occi_compute_state = "active"
    n1.kind = network and n1.id = "network-1" and  n1.occi_network_vlan = 1 and  n1.occi_network_label = "private" and n1.occi_network_state = "active"
    s1.kind = storage and s1.id = "storage-1" and s1.occi_storage_size = "128Gb" and s1.occi_storage_state = "active"
    one ni1 : NetworkInterface {
      ni1.kind = networkinterface and ni1.id = "networkinterface-1"
      ni1.source = c1 and ni1.target = n1
      ni1.occi_networkinterface_interface = "eth0"
      ni1.occi_networkinterface_mac = "00:24:64:17:a0:24"
      ni1.occi_networkinterface_state = "active"
    }
   one ni2 : NetworkInterface {
      ni2.kind = networkinterface and ni2.id = "networkinterface-2"
      ni2.source = c2 and ni2.target = n1
      ni2.occi_networkinterface_interface = "eth0"
      ni2.occi_networkinterface_mac = "00:24:64:17:a0:25"
      ni2.occi_networkinterface_state = "active"
    }
    one sl1 : StorageLink {
      sl1.kind = storagelink and sl1.id = "storagelink-1"
      sl1.source = c1 and sl1.target = s1
      sl1.occi_storagelink_deviceid ="hd1"
      sl1.occi_storagelink_mountpoint = "/storage"
      sl1.occi_storagelink_state = "active"
    }
    one sl2 : StorageLink {
      sl2.kind = storagelink and sl2.id = "storagelink-2"
      sl2.source = c2 and sl2.target = s1
      sl2.occi_storagelink_deviceid ="hd1"
      sl2.occi_storagelink_mountpoint = "/storage"
      sl2.occi_storagelink_state = "active"
    }
  }
} for 0 but exactly 2 Compute, exactly 1 Network, exactly 1 Storage, exactly 2 NetworkInterface, exactly 2 StorageLink

check AllEntitiesHaveTheCorrectKind {
  compute.isKindOf[Compute]
  network.isKindOf[Network]
  storage.isKindOf[Storage]
  networkinterface.isKindOf[NetworkInterface]
  storagelink.isKindOf[StorageLink]
  resource.isKindOf[Resource - Compute - Network - Storage]
  link.isKindOf[Link - NetworkInterface - StorageLink]
  no entity.entities
} for 10 but exactly 8 Kind

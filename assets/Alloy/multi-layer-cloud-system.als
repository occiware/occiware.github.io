open occi_core
open occi_infrastructure
open occi_platform
open occi_application

run Consistency {} for 10

run The_OCCI_Type_System {} for 0

run example {
  one a: Application, e : Environment {
    a.id = "application-1"
    a.kind = application
    no a.mixins
    a.occi_application_name = "MyApplication"
    a.occi_application_description = "This is my application."
    a.occi_application_instances = "1"
    a.occi_application_url = "http://www.acme.com/"
    a.occi_application_state = "active"
    one d1 : Deployable {
      d1.id = " deployable-1"
      d1.kind = deployable
      d1.occi_deployable_name = "MyWAR"
      d1.occi_deployable_description = "This is my WAR."
      d1.occi_deployable_contenttype = "war"
      d1.occi_deployable_location = "http://www.acme.com/my-war.war"
      d1.occi_deployable_state = "active"
      one dl : Link {
        dl.id = "deployable-link-1"
        dl.kind = link
        dl.source = a
        dl.target = d1
      }
    }
    e.id = "environment-1"
    e.kind = environment
    e.occi_environment_name = "MyEnvironment"
    e.occi_environment_description = "My environment"
    e.occi_environment_memory = "100Mo"
    no e.occi_environment_variables
    e.occi_environment_state = "active"
    one el : EnvironmentLink {
      el.id = "environment-link-1"
      el.kind = environmentlink
      no el.mixins
      el.source = a
      el.target = e
    }

    one disj c1, c2, c3: Compute {
    c1.id = "compute-1"
    c1.kind = compute
    no c1.mixins
    c1.occi_compute_architecture = "x86"
    c1.occi_compute_cores = 1
    c1.occi_compute_hostname = "host-1"
    c1.occi_compute_speed = "4Ghz"
    c1.occi_compute_memory = "4Go"
    c1.occi_compute_state = "active"

    c2.id = "compute-2"
    c2.kind = compute
    no c2.mixins
    c2.occi_compute_architecture = "x86"
    c2.occi_compute_cores = 2
    c2.occi_compute_hostname = "host-2"
    c2.occi_compute_speed = "8Ghz"
    c2.occi_compute_memory = "16Go"
    c2.occi_compute_state = "active"

    c3.id = "compute-3"
    c3.kind = compute
    no c3.mixins
    c3.occi_compute_architecture = "x86"
    c3.occi_compute_cores = 4
    c3.occi_compute_hostname = "host-3"
    c3.occi_compute_speed = "8Ghz"
    c3.occi_compute_memory = "16Go"
    c3.occi_compute_state = "active"

    one s1: Storage {
      s1.id = "storage-1"
      s1.kind = storage
      no s1.mixins
      s1.occi_storage_size = "16To"
      s1.occi_storage_state = "active"

      one sl1: StorageLink {
        sl1.id = "sl-1"
        sl1.kind = storagelink
        no sl1.mixins
        sl1.source = c1
        sl1.target = s1
        sl1.occi_storagelink_deviceid = "1"
        sl1.occi_storagelink_mountpoint = "/shared"
        sl1.occi_storagelink_state = "active"
      }
      one sl2: StorageLink {
       sl2.id = "sl-2"
        sl2.kind = storagelink
        no sl2.mixins
        sl2.source = c2
        sl2.target = s1
        sl2.occi_storagelink_deviceid = "1"
        sl2.occi_storagelink_mountpoint = "/shared"
        sl2.occi_storagelink_state = "active"
      }
      one sl3: StorageLink {
        sl3.id = "sl-3"
        sl3.kind = storagelink
        no sl3.mixins
        sl3.source = c3
        sl3.target = s1
        sl3.occi_storagelink_deviceid = "1"
        sl3.occi_storagelink_mountpoint = "/shared"
        sl3.occi_storagelink_state = "active"
      }
    }
    one n1 : Network {
      n1.id = "network-1"
      n1.kind = network
      no n1.mixins
      n1.occi_network_vlan=1
      no n1.occi_network_label
      n1.occi_network_state = "active"
      one ni1 : NetworkInterface {
       ni1.id = "nl-1"
       ni1.kind = networkinterface
       no ni1.mixins
       ni1.source = c1
       ni1.target = n1
       ni1.occi_networkinterface_interface = "eth0"
       ni1.occi_networkinterface_mac = "00:24:64:17:a0:24"
       ni1.occi_networkinterface_state = "active"
     }
     one ni2 : NetworkInterface {
       ni2.id = "nl-2"
       ni2.kind = networkinterface
       no ni2.mixins
       ni2.source = c2
       ni2.target = n1
       ni2.occi_networkinterface_interface = "eth0"
       ni2.occi_networkinterface_mac = "00:24:64:17:a0:25"
       ni2.occi_networkinterface_state = "active"
     }
     one ni3 : NetworkInterface {
       ni3.id = "nl-3"
       ni3.kind = networkinterface
       no ni3.mixins
       ni3.source = c3
       ni3.target = n1
       ni3.occi_networkinterface_interface = "eth0"
       ni3.occi_networkinterface_mac = "00:24:64:17:a0:26"
       ni3.occi_networkinterface_state = "active"
     }
   }
   one r1: Router {
     r1.id = "router-1"
     r1.kind = router
     no r1.mixins
     r1.occi_router_name = "router-1"
     r1.occi_router_version = "2.7"
     r1.occi_router_architecture = "sparc"
     r1.occi_router_state = "active"
     one rl1 : Link {
       rl1.id = "rl1"
       rl1.kind = link
       no rl1.mixins
       rl1.source = r1
       rl1.target = c1
     }
    one rl : RouterLink {
       rl.id = "router-link-1"
       rl.kind = routerlink
       no rl.mixins
       rl.source = e
       rl.target = r1
       rl.occi_routerlink_state = "active"
    }
   }
   one d1: Database {
     d1.id = "database-1"
     d1.kind = database
     no d1.mixins
     d1.occi_database_name = "Database-1"
     d1.occi_database_type = "MySql"
     d1.occi_database_architecture = "arm"
     d1.occi_database_version = "5.0"
     d1.occi_database_state = "active"
     one dl1 : Link {
       dl1.id = "l2"
       dl1.kind = link
       no dl1.mixins
       dl1.source = d1
      dl1.target = c2
    }
    one dl : DatabaseLink {
      dl.id = "database-link-1"
      dl.kind = databaselink
      no dl.mixins
       dl.source = e
       dl.target = d1
       dl.occi_databaselink_state = "active"
    }
    }
    one cc1: Container {
      cc1.id = "container-1"
      cc1.kind = container
      no cc1.mixins
      cc1.occi_container_name = "Tomcat"
      cc1.occi_container_version = "7.0.53"
      cc1.occi_container_architecture = "x86"
      cc1.occi_container_state = "active"
      one cl1 : Link {
        cl1.id = "cl-1"
        cl1.kind = link
        no cl1.mixins
        cl1.source = cc1
        cl1.target = c3
      }
    one cl : ContainerLink {
      cl.id = "container-link-1"
      cl.kind = containerlink
      no cl.mixins
      cl.source = e
      cl.target = cc1
      cl.occi_containerlink_state = "active"
     }
    }
    }
  }
  no Entity.mixins
} for 0 but
  exactly 3 Compute,
  exactly 1 Storage,
  exactly 1 Network, 
  exactly 1 Router,
  exactly 1 Container,
  exactly 1 Database,
  exactly 1 Environment,
  exactly 1 Application,
  exactly 1 Deployable,
  exactly 3 NetworkInterface,
  exactly 3 StorageLink,
  exactly 1 ContainerLink,
  exactly 1 RouterLink,
  exactly 1 DatabaseLink,
  exactly 1 EnvironmentLink,
  exactly 14 Link

check AllEntitiesHaveTheCorrectKind {
  compute.isKindOf[Compute]
  network.isKindOf[Network]
  storage.isKindOf[Storage]
  networkinterface.isKindOf[NetworkInterface]
  storagelink.isKindOf[StorageLink]
  container.isKindOf[Container]
  database.isKindOf[Database]
  router.isKindOf[Router]
  containerlink.isKindOf[ContainerLink]
  databaselink.isKindOf[DatabaseLink]
  routerlink.isKindOf[RouterLink]
  environment.isKindOf[Environment]
  application.isKindOf[Application]
  deployable.isKindOf[Deployable]
  environmentlink.isKindOf[EnvironmentLink]
  resource.isKindOf[Resource - Compute - Network - Storage - Container - Database - Router - Environment - Application - Deployable]
  link.isKindOf[Link - NetworkInterface - StorageLink - ContainerLink - DatabaseLink - RouterLink - EnvironmentLink]
  no entity.entities
} for 10 but exactly 18 Kind

module occi_platform

open occi_core

sig Container extends Resource {
   occi_container_name: lone String,
   occi_container_version: lone String,
   occi_container_architecture: lone String,
   occi_container_state: lone String
} {
  hasKind[container]
} 

one sig container extends Kind {} {
  term="container"
  scheme="http://schemas.ogf.org/occi/platform#"
  title="Service Container Resource"
  attributes = occi_container_name + occi_container_version + occi_container_architecture + occi_container_state
  actions = occi_container_start + occi_container_stop + occi_container_restart + occi_container_suspend
  parent = resource
  entities in Container
}

one sig occi_container_name extends Attribute {} {
  name = "occi.container.name"
  type = "string"
  mutable = true
  required = false
  no default
  description = "Container instance name"
}
one sig occi_container_version extends Attribute {} {
  name = "occi.container.version"
  type = "string"
  mutable = true
  required = false
  no default
  description = "Version label of the instance"
}
one sig occi_container_architecture extends Attribute {} {
  name = "occi.container.architecture"
  type = "enum {x86, x86_64, armv7}"
  mutable = true
  required = false
  default = "x86"
  description = "CPU architecture of the instance"
}
one sig occi_container_state extends Attribute {} {
  name = "occi.container.state"
  type = "enum {unavailable, started, stopped}"
  mutable = false
  required = false
  default = "unavailable"
  description = "current state of the instance"
}

one sig occi_container_start extends Action {} {
  term="start"
  scheme="http://schemas.ogf.org/occi/platform/container/action#"
  title = "start the instance"
  no attributes
}
one sig occi_container_stop extends Action {} {
  term="stop"
  scheme="http://schemas.ogf.org/occi/platform/container/action#"
  title = "stop the instance"
  no attributes
}
one sig occi_container_restart extends Action {} {
  term="restart"
  scheme="http://schemas.ogf.org/occi/platform/container/action#"
  title = "restart the instance"
  no attributes
}
one sig occi_container_suspend extends Action {} {
  term="suspend"
  scheme="http://schemas.ogf.org/occi/platform/container/action#"
  title = "suspend the instance"
  no attributes
}

sig Database extends Resource {
  occi_database_name: lone String,
  occi_database_type: lone String,
  occi_database_architecture: lone String,
  occi_database_version: lone String,
  occi_database_state: lone String
} {
  hasKind[database]
} 

one sig database extends Kind {} {
  term="database"
  scheme="http://schemas.ogf.org/occi/platform#"
  title="Database Resource"
  attributes = occi_database_name + occi_database_type + occi_database_architecture + occi_database_architecture + occi_database_version + occi_database_state
  actions = occi_database_start + occi_database_stop + occi_database_restart + occi_database_backup + occi_database_snapshot
  parent = resource
  entities in Database
}

one sig occi_database_name extends Attribute {} {
  name = "occi.database.name"
  type = "string"
  mutable = true
  required = false
  no default
  description = "Database instance name"
}
one sig occi_database_type extends Attribute {} {
  name = "occi.database.type"
  type = "string"
  mutable = true
  required = false
  default = "sql" 
  description = "Scheme type of the instance"
}
one sig occi_database_architecture extends Attribute {} {
  name = "occi.database.architecture"
  type = "enum {x86, x86_64, armv7}"
  mutable = true
  required = false
  default = "x86" 
  description = "CPU architecture of the instance"
}
one sig occi_database_version extends Attribute {} {
  name = "occi.database.version"
  type = "string"
  mutable = true
  required = false
  no default
  description = "Version label of the instance"
}
one sig occi_database_state extends Attribute {} {
  name = "occi.database.state"
  type = "enum {unavailable, available}"
  mutable = false
  required = false
  default = "unavailable"
  description = "current state of the instance"
}

one sig occi_database_start extends Action {} {
  term="start"
  scheme="http://schemas.ogf.org/occi/platform/database/action#"
  title = "start the instance"
  no attributes
}
one sig occi_database_stop extends Action {} {
  term="stop"
  scheme="http://schemas.ogf.org/occi/platform/database/action#"
  title = "stop the instance"
  no attributes
}
one sig occi_database_restart extends Action {} {
  term="restart"
  scheme="http://schemas.ogf.org/occi/platform/database/action#"
  title = "restart the instance"
  no attributes
}
one sig occi_database_backup extends Action {} {
  term="backup"
  scheme="http://schemas.ogf.org/occi/platform/database/action#"
  title = "backup the instance"
  no attributes
}
one sig occi_database_snapshot extends Action {} {
  term="snapshot"
  scheme="http://schemas.ogf.org/occi/platform/database/action#"
  title = "snapshot the instance"
  no attributes
}

sig Router extends Resource {
  occi_router_name: lone String,
  occi_router_version: lone String,
  occi_router_architecture: lone String,
  occi_router_state: lone String
} {
  hasKind[router]
} 

one sig router extends Kind {} {
  term="router"
  scheme="http://schemas.ogf.org/occi/platform#"
  title="Router Resource"
  attributes = occi_router_name + occi_router_version + occi_router_architecture + occi_router_state
  actions = occi_router_configure + occi_router_enable + occi_router_disable
  parent = resource
  entities in Router
}

one sig occi_router_name extends Attribute {} {
  name = "occi.router.name"
  type = "string"
  mutable = true
  required = false
  no default
  description = "Router instance name"
}
one sig occi_router_version extends Attribute {} {
  name = "occi.router.version"
  type = "string"
  mutable = true
  required = false
  no default
  description = "Version label of the instance"
}
one sig occi_router_architecture extends Attribute {} {
  name = "occi.router.architecture"
  type = "enum {x86, x86_64, armv7}"
  mutable = true
  required = false
  default = "x86"
  description = "CPU architecture of the instance"
}
one sig occi_router_state extends Attribute {} {
  name = "occi.router.state"
  type = "enum {enabled, disabled}"
  mutable = false
  required = false
  default = "disabled"
  description = "current state of the instance"
}

one sig occi_router_configure extends Action {} {
  term="configure"
  scheme="http://schemas.ogf.org/occi/platform/database/action#"
  title = "configure the instance"
  attributes = occi_router_configure_config
}
one sig occi_router_configure_config extends Attribute {} {
  name = "config"
  type = "string"
  mutable = false
  required = false
  no default
  description = "Router config"
}
one sig occi_router_enable extends Action {} {
  term="enable"
  scheme="http://schemas.ogf.org/occi/platform/router/action#"
  title = "enable the instance"
  no attributes
}
one sig occi_router_disable extends Action {} {
  term="disable"
  scheme="http://schemas.ogf.org/occi/platform/router/action#"
  title = "disable the instance"
  no attributes
}

sig DatabaseLink extends Link {
  occi_databaselink_state: lone String
} {
  target in Database
  hasKind[databaselink]
}

one sig databaselink extends Kind {} {
  term="databaselink"
  scheme="http://schemas.ogf.org/occi/platform#"
  title="DatabaseLink Link"
  attributes = occi_databaselink_state
  no actions
  parent = link
  entities in DatabaseLink
}
one sig occi_databaselink_state extends Attribute {} {
  name = "occi.databaselink.state"
  type = "enum {inactive, active}"
  mutable = false
  required = false
  default = "inactive"
  description = "current state of the instance"
}

sig RouterLink extends Link {
  occi_routerlink_state: lone String
} {
  target in Router
  hasKind[routerlink]
}

one sig routerlink extends Kind {} {
  term="routerlink"
  scheme="http://schemas.ogf.org/occi/platform#"
  title="RouterLink Link"
  attributes = occi_routerlink_state
  no actions
  parent = link
  entities in RouterLink
}
one sig occi_routerlink_state extends Attribute {} {
  name = "occi.routerlink.state"
  type = "enum {inactive, active}"
  mutable = false
  required = false
  default = "inactive"
  description = "current state of the instance"
}

sig ContainerLink extends Link {
  occi_containerlink_state: lone String
} {
  target in Container
  hasKind[containerlink]
}

one sig containerlink extends Kind {} {
  term="containerlink"
  scheme="http://schemas.ogf.org/occi/platform#"
  title="ContainerLink Link"
  attributes = occi_containerlink_state
  no actions
  parent = link
  entities in ContainerLink
}
one sig occi_containerlink_state extends Attribute {} {
  name = "occi.containerlink.state"
  type = "enum {inactive, active}"
  mutable = false
  required = false
  default = "inactive"
  description = "current state of the instance"
}

run Consistency {} for 10

run The_OCCI_Type_System {} for 0

run an_OCCI_Platform_instance {
} for 0 but exactly 1 Container, exactly 1 Database, exactly 1 Router

check AllEntitiesHaveTheCorrectKind {
  container.isKindOf[Container]
  database.isKindOf[Database]
  router.isKindOf[Router]
  containerlink.isKindOf[ContainerLink]
  databaselink.isKindOf[DatabaseLink]
  routerlink.isKindOf[RouterLink]
  resource.isKindOf[Resource - Container - Database - Router]
  link.isKindOf[Link - ContainerLink - DatabaseLink - RouterLink]
  no entity.entities
} for 10 but exactly 9 Kind

module occi_application

open occi_core

sig Environment extends Resource {
  occi_environment_name: lone String,
  occi_environment_description: lone String,
  occi_environment_memory: lone String,
  occi_environment_variables: set String,
  occi_environment_state: lone String
} {
  hasKind[environment]
} 

one sig environment extends Kind {} {
  term="environment"
  scheme="http://schemas.ogf.org/occi/application#"
  title="Environment Resource" 
  attributes = occi_environment_name + occi_environment_description + occi_environment_memory + occi_environment_variables + occi_environment_state
  actions = occi_environment_update
  parent = resource
  entities in Environment
}

one sig occi_environment_name extends Attribute {} {
  name = "occi.environment.name"
  type = "string"
  mutable = true
  required = false
  no default
  description = "Environment instance name"
}
one sig occi_environment_description extends Attribute {} {
  name = "occi.environment.description"
  type = "string"
  mutable = true
  required = false
  no default
  description = "Human readable description of the instance"
}
one sig occi_environment_memory extends Attribute {} {
  name = "occi.environment.memory"
  type = "float"
  mutable = true
  required = false
  no default
  description = "RAM allocated to the instance"
}
one sig occi_environment_variables extends Attribute {} {
  name = "occi.environment.variables"
  type = "string"
  mutable = true
  required = false
  no default
  description = "Environment variables associated to the instance"
}
one sig occi_environment_state extends Attribute {} {
  name = "occi.environment.state"
  type = "string"
  mutable = true
  required = false
  default = "inactive"
  description = "Current state of the instance"
}

// TSP: What difference between next action and the REST-based Update operation?
one sig occi_environment_update extends Action {} {
  term="update"
  scheme="http://schemas.ogf.org/occi/application/environment/action#"
  title = "Update Environment context"
  attributes = occi_environment_update_context
}
one sig occi_environment_update_context extends Attribute {} {
  name = "context"
  type = "occi:environment"
  mutable = false
  required = false
  no default
  description = "New environment context"
}

sig Application extends Resource {
  occi_application_name: lone String,
  occi_application_description: lone String,
  occi_application_instances: lone String,
  occi_application_url: lone String,
  occi_application_state: lone String
} {
  hasKind[application]
} 

one sig application extends Kind {} {
  term="application"
  scheme="http://schemas.ogf.org/occi/application#"
  title="Application Resource" 
  attributes = occi_application_name + occi_application_description + occi_application_instances + occi_application_url + occi_application_state
  actions = occi_application_start + occi_application_stop + occi_application_restart + occi_application_update
  parent = resource
  entities in Application
}

one sig occi_application_name extends Attribute {} {
  name = "occi.application.name"
  type = "string"
  mutable = true
  required = false
  no default
  description = "Application instance name"
}
one sig occi_application_description extends Attribute {} {
  name = "occi.application.description"
  type = "string"
  mutable = true
  required = false
  no default
  description = "Human readable description of the instance"
}
one sig occi_application_instances extends Attribute {} {
  name = "occi.application.instances"
  type = "integer"
  mutable = true
  required = false
  no default
  description = "Number of the instance copies"
}
one sig occi_application_url extends Attribute {} {
  name = "occi.application.url"
  type = "URL"
  mutable = true
  required = false
  no default
  description = "The public URL associated to the instance"
}
one sig occi_application_state extends Attribute {} {
  name = "occi.application.state"
  type = "enum{…}"
  mutable = false
  required = false
  default = "stopped"
  description = "Current state of the instance"
}

one sig occi_application_start extends Action {} {
  term="start"
  scheme="http://schemas.ogf.org/occi/application/application/action#"
  title = "Start the instance"
  no attributes
}
one sig occi_application_stop extends Action {} {
  term="stop"
  scheme="http://schemas.ogf.org/occi/application/application/action#"
  title = "Stop the instance"
  no attributes
}
one sig occi_application_restart extends Action {} {
  term="restart"
  scheme="http://schemas.ogf.org/occi/application/application/action#"
  title = "Restart the instance"
  no attributes
}
// TSP: What difference between next action and the REST-based Update operation?
one sig occi_application_update extends Action {} {
  term="update"
  scheme="http://schemas.ogf.org/occi/application/application/action#"
  title = "Update the instance"
  attributes = occi_application_update_context
}
one sig occi_application_update_context extends Attribute {} {
  name = "context"
  type = "occi:application"
  mutable = false
  required = false
  no default
  description = "New application context"
}

sig Deployable extends Resource {
  occi_deployable_name: lone String,
  occi_deployable_description: lone String,
  occi_deployable_contenttype: lone String,
  occi_deployable_location: lone URI,
  occi_deployable_state: lone String
} {
  hasKind[deployable]
} 

one sig deployable extends Kind {} {
  term="deployable"
  scheme="http://schemas.ogf.org/occi/application#"
  title="Deployable Resource" 
  attributes = occi_deployable_name + occi_deployable_description + occi_deployable_contenttype + occi_deployable_location + occi_deployable_state
  actions = occi_deployable_update
  parent = resource
  entities in Deployable
}

one sig occi_deployable_name extends Attribute {} {
  name = "occi.deployable.name"
  type = "string"
  mutable = true
  required = false
  no default
  description = "Application instance name"
}
one sig occi_deployable_description extends Attribute {} {
  name = "occi.deployable.description"
  type = "string"
  mutable = true
  required = false
  no default
  description = "Human readable description of the instance"
}
one sig occi_deployable_contenttype extends Attribute {} {
  name = "occi.deployable.contenttype"
  type = "string"
  mutable = true
  required = false
  no default
  description = "Archives type of the instance"
}
one sig occi_deployable_location extends Attribute {} {
  name = "occi.deployable.location"
  type = "URI"
  mutable = true
  required = false
  no default
  description = "Location of the artifact associated to the instance_can be a file path or a logical Name"
}
one sig occi_deployable_state extends Attribute {} {
  name = "occi.deployable.state"
  type = "enum {...}"
  mutable = false
  required = false
  default = "available"
  description = "current state of the instance"
}

// TSP: What difference between next action and the REST-based Update operation?
one sig occi_deployable_update extends Action {} {
  term="update"
  scheme="http://schemas.ogf.org/occi/application/deployable/action#"
  title = "Update the instance"
  attributes = occi_deployable_update_deployable
}
one sig occi_deployable_update_deployable extends Attribute {} {
  name = "deployable"
  type = "occi:deployable"
  mutable = false
  required = false
  no default
  description = "New instance context"
}

sig EnvironmentLink extends Link {
  occi_environmentlink_state: one String
} {
  target in Environment
  hasKind[environmentlink]
} 

one sig environmentlink extends Kind {} {
  term="environmentlink"
  scheme="http://schemas.ogf.org/occi/application#"
  title="EnvironmentLink Link" 
  attributes = occi_environmentlink_state
  no actions
  parent = link
  entities in EnvironmentLink
}
one sig occi_environmentlink_state extends Attribute {} {
  name = "occi.environmentlink.state"
  type = "enum {...}"
  mutable = false
  required = false
  default = "active"
  description = "Current state of the instance"
}

run Consistency {} for 10

run The_OCCI_Type_System {} for 0

run an_OCCI_Application_instance {
} for 0 but exactly 1 Environment, exactly 1 Application, exactly 1 Deployable, exactly 1 EnvironmentLink

check AllEntitiesHaveTheCorrectKind {
  environment.isKindOf[Environment]
  application.isKindOf[Application]
  deployable.isKindOf[Deployable]
  environmentlink.isKindOf[EnvironmentLink]
  resource.isKindOf[Resource - Environment - Application - Deployable]
  link.isKindOf[Link - EnvironmentLink]
  no entity.entities
} for 10 but exactly 7 Kind

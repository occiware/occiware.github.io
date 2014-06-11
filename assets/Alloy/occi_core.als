module occi_core

enum Boolean {false, true}
sig URI  in String {}

abstract sig Category {
  term: one String,
  scheme: one URI,
  title: lone String,
  attributes: set Attribute,
  identity : term -> scheme
} {
  no disj a1, a2 : attributes | a1.name = a2.name
}

sig Attribute {
  name: one String,
  type: lone String,
  mutable: lone Boolean,
  required: lone Boolean,
  default: lone String,
  description: lone String
} {
  one ~attributes[this].identity
}

sig Kind extends Category {
  actions: set Action,
  parent: lone Kind,
  entities: set Entity
} {
  entities = ~kind[this]
  entity in this.*@parent
  no attributes.name & this.^@parent.@attributes.name
  no p : this.^@parent | identity = p.@identity
  no disj e1, e2 : entities | e1.id = e2.id
}

sig Mixin extends Category {
  actions: set Action,
  depends: set Mixin,
  applies: set Kind,
  entities: set Entity
} {
  entities = ~mixins[this]
  all e : entities | (applies + entity) in e.kind.*parent
  no d : this.^@depends | identity = d.@identity
  no disj k1, k2 : applies | k1.@identity = k2.@identity
  no disj e1, e2 : entities | e1.id = e2.id
}

sig Action extends Category {} {
  one ~(Kind<:actions + Mixin<:actions)[this]
  no a : Action - this | a.@identity = identity 
}

abstract sig Entity {
  id: one URI,
  kind: one Kind,
  mixins: set Mixin,
} {
  no disj m1, m2 : mixins | m1.identity = m2.identity
  hasKind[entity]
}

pred Entity.hasKind[k : Kind]
{
  k in this.kind.*parent
}

one sig entity extends Kind {} {
  term = "entity"
  scheme = "http://schemas.ogf.oci/occi/core#"
  title = "Entity type"
  attributes = occi_core_title
  no actions
  no parent
}
one sig occi_core_title extends Attribute {} {
  name = "occi.core.title"
  type = "string"
  mutable = true
  required = false
  no default
  description = "The display name of the instance" 
}

sig Resource extends Entity {
  links: set Link,
} {
  no disj l1, l2 : links | l1.@id = l2.@id
  hasKind[resource]
} 

one sig resource extends Kind {} {
  term = "resource"
  scheme = "http://schemas.ogf.oci/occi/core#"
  title = "Resource"
  attributes = occi_core_summary
  no actions
  parent = entity
  entities in Resource
}
one sig occi_core_summary extends Attribute {} {
  name = "occi.core.summary"
  type = "string"
  mutable = true
  required = false
  no default
  description = "A summarising description of the Resource instance" 
}

sig Link extends Entity {
  source: one Resource,
  target: one Resource
} {
  source = ~links[this]
  hasKind[link]
}

one sig link extends Kind {} {
  term = "link"
  scheme = "http://schemas.ogf.oci/occi/core#"
  title = "Link"
  no attributes
  no actions
  parent = entity
  entities in Link
}

run Consistency {} for 10

run The_OCCI_Core_Type_System {} for 0

run an_OCCI_Core_instance {
  one r1, r2, r3 : Resource,  l1, l2 : Link {
    r1.id = "r1" and r2.id = "r2" and r3.id = "r3"
    l1.id = "l1" and l2.id = "l2" 
    l1.source = r1 and l1.target = r2
    l2.source = r2 and l2.target = r3
  }
} for 0 but exactly 3 Resource, exactly 2 Link


pred isKindOf[aKind : Kind, setEntities : set Entity]
{
  all e : setEntities | e.kind = aKind
  aKind.entities = setEntities
}

check AllEntitiesHaveTheCorrectKind {
  resource.isKindOf[Resource]
  link.isKindOf[Link]
  no entity.entities
} for 10 but exactly 3 Kind

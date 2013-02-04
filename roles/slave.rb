name "slave"
description "slave database role"

run_list "recipe[apt]", "recipe[build-essential]", "recipe[mysql::server]", "recipe[mysql::ruby]", "recipe[zendesk::slave]"

override_attributes(:mysql => {
    :"bind_address" => "0.0.0.0"
  },
  :build_essential => {
    :compiletime => true
  }
)

name "master"
description "master database role"

run_list "recipe[apt]", "recipe[build-essential]", "recipe[mysql::server]", "recipe[mysql::ruby]"

override_attributes(:mysql => {
    :"bind_address" => "0.0.0.0",
    :tunable => {
      :log_bin => "db1-mysql-bin",
      :binlog_format => "STATEMENT",
      :slave_exec_mode => "IDEMPOTENT"
    }
  },
  :build_essential => {
    :compiletime => true
  }
)


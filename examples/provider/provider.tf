terraform {
  required_providers {
    radosgw = {
      source = "digi-talo/radosgw"
    }
  }
}

provider "radosgw" {
  endpoint = "http://127.0.0.1:9000"
  # set access_key_id and secret_access_key via ACCESS_KEY_ID and SECRET_ACCESS_KEY env variables
}

resource "radosgw_user" "demo_user" {
  user_id      = "demo"
  display_name = "Ceph demo user"
  max_buckets  = 5
}

resource "radosgw_subuser" "demo_subuser_readonly" {
  user_id = "demo"
  subuser = "readonly"
  access  = "read"
}

resource "radosgw_key" "demo_default_key" {
  user = "demo"
}

resource "radosgw_key" "demo_second_key" {
  user = "demo"
}

resource "radosgw_key" "demo_readonly_key" {
  user    = "demo"
  subuser = "readonly"
}

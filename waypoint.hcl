project = "example-nodejs"

runner {
  enable = true

  data_source "git" {
    url  = "https://github.com/renansdias/nodejs-waypoint.git"
  }
}

app "example-nodejs" {

  build {
    use "pack" {}
    registry {
      use "docker" {
        image = "renansdias/nodejs-waypoint-test"
        tag   = "latest"
      }
    }
  }

  deploy {
    use "nomad" {
      // these options both default to the values shown, but are left here to
      // show theya are configurable
      datacenter = "us-east-1a"
      namespace  = "default"
    }
  }
}

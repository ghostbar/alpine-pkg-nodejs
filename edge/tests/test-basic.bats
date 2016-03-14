setup() {
  docker build -t local/node-lts:test .
  docker history local/node-lts:test >/dev/null 2>&1
}

@test "version is correct" {
  run docker run --rm local/node-lts:test node --version
  [ "$status" -eq 0 ]
  [ "$output" = "v4.4.0" ]
}

@test "installs public native-js npm" {
  run docker run --rm local/node-lts:test npm install async
  [ "$status" -eq 0 ]
}

teardown() {
  docker rmi local/node-lts:test
}

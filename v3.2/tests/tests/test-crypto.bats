setup() {
  docker build -t local/node-lts:test .
  docker history local/node-lts:test >/dev/null 2>&1
  docker build -t test/node-lts:jsonwebtoken tests/crypto
  docker history test/node-lts:jsonwebtoken >/dev/null 2>&1
}

@test "create md5 hash" {
  run docker run --rm local/node-lts:test node -e \
    "console.log(require('crypto').createHash('md5').update('test').digest('hex'))"
  [ "$status" -eq 0 ]
}

@test "crypto signatures with jsonwebtoken" {
  run docker run --rm test/node-lts:jsonwebtoken
  [ "$status" -eq 0 ]
}

teardown() {
  docker rmi test/node-lts:jsonwebtoken
  docker rmi local/node-lts:test
}

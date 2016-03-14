var jwt = require('jsonwebtoken')
var uuid = require('node-uuid')
var fs = require('fs')

var payload = {
  jti: uuid.v4(),
  aud: 'one',
  sub: 'two',
  iss: 'randomly',
  user: {
    id: 'one',
    email: 'two',
    scopes: 'one'
  }
}

jwt.sign(payload, fs.readFileSync('./secp521r1-key.pem'), {algorithm: 'RS256'}, function(token) {
  console.log(token)
})

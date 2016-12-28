FROM local/node-lts:test

WORKDIR /opt
COPY test.js /opt/
COPY secp521r1-key.pem /opt/

RUN npm install jsonwebtoken node-uuid

CMD ["node", "test.js"]

FROM node:current-alpine3.18

RUN npm install -g jwt-cracker

# Adding some secrets
RUN apk add wget && wget https://raw.githubusercontent.com/wallarm/jwt-secrets/master/jwt.secrets.list

COPY jwt-cracker.sh /usr/bin/jwt-cracker
RUN chmod +x /usr/bin/jwt-cracker
ENTRYPOINT ["/usr/bin/jwt-cracker"]

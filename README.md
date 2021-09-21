# Authentication Providers

## Configuration

1. Add the following on your `/etc/hosts` file.

```bash
 # Authentication providers hosts
 127.0.0.1 alpha.localhost
 127.0.0.1 beta.localhost
```

2. Create and start the containers

```bash
docker-compose up -d
```

3. Alpha and Beta Keycloak services will be available at:

  | Service | Address                     | Username | Password |
  | ------- | --------------------------- | -------- | -------- |
  | Alpha   | http://alpha.localhost:8081 | alpha    | alpha    |
  | Beta    | http://beta.localhost:8082  | beta     | beta     |

4. Each Keycloak service has its own realm and users defined:

  | Service | Realm    | Username |
  | ------- | -------- | -------- |
  | Alpha   | avengers | ironman  |
  | Alpha   | avengers | hulk     |
  | Beta    | xmen     | beast    |
  | Beta    | xmen     | cyclops  |

**Obs:** For sake of simplicity, all user passwords are `123456`.

5. Customized authentication will be available at:

http://beta.localhost:8082/auth/realms/xmen/account/
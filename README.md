# Authentication Providers

This is a test for SAML integration between two authentication providers. First service (Alpha) will act as a identity provider for the second (Beta).

## Once I finish configuring, what will I get?

- Two Keycloak services - Alpha and Beta - running locallly.
- A realm named "Avengers" on Alpha service with two users.
- A realm named "X-Men" on Beta service with two users.
- An authentication page that accepts credentials from both "Avengers" and "X-Men" realms.

The following image presents the containers created by this project and how they communicate with each other.
![containers-created-by-the-project](https://user-images.githubusercontent.com/13152452/134371560-e32695d8-bf10-45c7-98e9-cc2f6d993c67.png)

And here is a representation of the services available and their addresses.
![services-available-and-addresses](https://user-images.githubusercontent.com/13152452/134372232-e9ab2795-ac88-41e6-9704-90b5061abda9.png)


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

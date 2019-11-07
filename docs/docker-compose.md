## Docker Compose 

```docker-compose
version: '3.0'
services:
  db:
    image: mariadb:latest
    ports:
      - '3306:3306'
    volumes:
      - dbvol:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: test
      MYSQL_DATABASE: test
      MYSQL_USER: test
      MYSQL_PASSWORD: test

  website:
    depends_on:
      - 'db'
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - '3000:3000'
    volumes:
      - ./config/credentials/production.key:/app/config/credentials/production.key
      - ./config/credentials/production.yml.enc:/app/config/credentials/production.yml.enc
    environment:
      DB_HOST: test
      DB_NAME: test
      DB_USER: test
      DB_PASS: test
      EMAIL_HOST: localhost:3000


volumes:
  dbvol:
```
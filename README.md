# README

It includes the barebones + a little bit more to get you up and running. 

This was made for: 
  - Ruby: ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-darwin18]
  - Rails: 6.0.0
  - Webpacker: 4.0.7
  - Node: v10.16.3
  - Yarn: 1.16.0
  - Docker: Docker version 19.03.1, build 74b1e89
  - Docker-compose: docker-compose version 1.24.1, build 4667896b


## Getting Started

I wanted this to be as smooth as possible, so start here!

### Rename the Project

```
bundle install
rails g rename:into New-Name
```


### Set the upstream

Set this. Do not hack on this and then push to master like some idiot.

```
# List current remotes
git remote -v

# Change the remote
$ git remote set-url origin git@github.com:USERNAME/REPOSITORY.git
```

### Environment 

Both the application and the docker-compose file use `.env`; you will need to move this file!

```
# Copy `.env.development` to `.env`
cp .env.development .env
```

```
# Create a new set of envioronment keys:
EDITOR=vim rails credentials:edit --environment production
```

### Docker

Docker is configured for production and development. The environments are meant to be as close to one another as possible.

For local development the application needs the following to run:
```
docker-compose up db
./bin/webpack-dev-server
rails s
```

The docker container is built for production, but the enviornment variables will need to be set on the production web server. See the enviornment section for more information.
```
docker-compose up
```

```
irb
import 'securerandom'
SecureRandom.hex(64)
EDITOR=vim rails credentials:edit --environment production
```


## Running into a problem?

### Database issues with docker or root user password broken?

Try renaming the `volume` at the bottom to something else.

The application is configured to run mysql as the *all environment* database. 
This decision was made to keep development and production environments as similiar as possible.


## Need More Customization?

  - [Devise - Github](https://github.com/plataformatec/devise)
  - [Rails Naming Conventions - Github, Gist](https://gist.github.com/iangreenleaf/b206d09c587e8fc6399e)
  - [Mailgun Ruby - Github](https://github.com/mailgun/mailgun-ruby)


## More info

Don't hesitate to reach out: Jack Moore, [jmoore6786wjm@hotmail.com](mailto:jmoore6786wjm@hotmail.com)


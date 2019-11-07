# README

This repo includes a barebones rails 6.0.0 application plus a little bit more to get you up and running. 

This repo is meant for use with: 
  - Ruby: ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-darwin18]
  - Rails: 6.0.0
  - Webpacker: 4.0.7
  - Node: v10.16.3
  - Yarn: 1.16.0
  - Docker: Docker version 19.03.1, build 74b1e89
  - Docker-compose: docker-compose version 1.24.1, build 4667896b


## Getting Started

I want this to be as smooth as possible, so start here!

### Rename the Project

```
bundle install
yarn install
bundle install --binstubs
rails g rename:into New-Name
```


### Set the upstream & Removing the Commits from this Repo

Set this. Do not hack on this and then push to master like some idiot.

```
# List current remotes
git remote -v

# Change the remote
$ git remote set-url origin git@github.com:USERNAME/REPOSITORY.git
```

Do not forget to do this!

```
git checkout --orphan temp_branch
git add .
git commit -m "Boilerplate"
git branch -D master
git branch -m master
git push -f origin master
```

### Environment 

Both the application and the docker-compose file use `.env` file; you will need to move this file!

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
```

```ruby
import 'securerandom'
SecureRandom.hex(64)
EDITOR=vim rails credentials:edit --environment production
```

After completing the new application setup and everything is looking up to par, please make sure to change up the Readme for your new application!

## Running into a problem?

### Database issues with docker or root user password broken?

Try renaming the `volume` at the bottom to something else.

The application is configured to run mysql as the *every environment* database. 
This decision was made to keep development and production environments as similiar as possible.

### Asset Compiling or Docker Build Issues

The `Dockerfile` pulls directly from the Alpine edge repositories which means there is possibility for error and breakage. I usually integrate CICD with gitlab, and build repos often. I plan to keep this template up to date as such breakage occurs.



## Need More Customization?

  - [Devise - Github](https://github.com/plataformatec/devise)
  - [Rails Naming Conventions - Github, Gist](https://gist.github.com/iangreenleaf/b206d09c587e8fc6399e)
  - [Mailgun Ruby - Github](https://github.com/mailgun/mailgun-ruby)


## More info

Don't hesitate to reach out: Jack Moore, [jmoore6786wjm@hotmail.com](mailto:jmoore6786wjm@hotmail.com)


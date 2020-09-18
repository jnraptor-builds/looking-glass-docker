# looking-glass-docker

- LookingGlass code is based on [LookingGlass](https://github.com/telephone/LookingGlass) and updated for PHP7 
- Base image is from [php:apache](https://hub.docker.com/_/php)

## How to use this image

```Docker-Compose
looking-glass:
  container_name: looking-glass
  image: jnraptor/looking-glass:latest
  ports:
  - "80:80"
  env_file:
  - looking-glass.env
```

## Configuration through env file

```
lg_ip4=x.x.x.x
lg_ip6=y:y:y:y::1
lg_loc=somewhere
lg_sitename=Looking Glass
lg_siteurl=https://lg.my.site
lg_testfiles=25MB 50MB 100MB
```

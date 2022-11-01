# Jekyll + Just-The-Docs Repository for use with Github Pages

Built with Github Pages and [Jekyll](https://jekyllrb.com/)

### Style Used:
[Just the Docs](https://just-the-docs.github.io/just-the-docs/)

### How to use Jekyll
[Step-by-Step Guide](https://jekyllrb.com/docs/step-by-step/02-liquid/)


## Setting up a documentation environment locally

## Pre-requestites ##

1. Git

2. Docker

### Clone Template Repo

### From the cloned repo directory

`make build`
To build the Docker Image and Container

*** 
`make start`
To launch Jekyll

Open a browser to [local documentation site](http://localhost:4000)

***

### Other Commands

`make stop`

To stop the development environment

*** 
`make rebuild`
To rebuild the local development environment

***
`make open`
Open an interactive terminal in the container

***
`make jekyll`
run Jekyll on port 4000

***
`make new`
create a new empty default site and configuration

***
`make wipe`
Erase default site files

*** 
`make pre`
Clear WSL Zone files
https://cloudbytes.dev/snippets/wsl2-find-and-delete-zoneidentifier-files

***
`make clean`
Delete the Docker Container and Image

***

## For Reference

### Gemfile Contents 
```
# frozen_string_literal: true

source "https://rubygems.org"

# gem "rails"
gem "jekyll"
gem "github-pages"
gem "just-the-docs", "0.4.0.rc3"
gem "jekyll-seo-tag"
gem "webrick"
gem "jekyll-default-layout"
```

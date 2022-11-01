TOPDIR=$(shell pwd)


build: ## Build docker image
	docker build -t jekyll-ghpages .
	docker run -p 4000:4000 --volume="$(TOPDIR):/workspaces/site" -dit --name ray-blog jekyll-ghpages
##	docker-compose build

start:
#	docker-compose up --force-recreate
	docker start ray-blog
	docker exec -d -it -w /workspaces/site ray-blog sh -c "bundle exec jekyll serve --host 0.0.0.0 --config _config_local.yml"

	@echo "Jekyll service is starting... please wait 10 seconds."
	@echo "Open http://localhost:4000/ in your preferred web browser."

stop: 
##	docker-compose stop
	docker stop ray-blog

rebuild: # run jekyll build inside container to update on the go
##	docker-compose exec jekyll jekyll build --incremental --watch
	make clean
	make build
	make start

open:
	docker exec -it ray-blog "/bin/ash"

jekyll:
	docker exec -it -w /workspaces/site ray-blog sh -c "bundle exec jekyll serve --host 0.0.0.0 --config _config_local.yml"

new:
	docker exec -it -w /workspaces/site ray-blog sh -c "bundle exec jekyll new --force --skip-bundle ."

wipe:
	make start
	docker exec -it -w /workspaces/site ray-blog sh -c "./wipe_site.sh"
	make stop

prep:
	docker exec -it -w /workspace/site ray-blog sh -c "find . -name "*:Zone.Identifier" -type f -delete"

clean: 
	docker rm -f ray-blog
	docker image rm -f jekyll-ghpages
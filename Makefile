IMAGE=jnishii/docker-gym-nongpu38
VERSION=$(shell cat VERSION)

release: 
	echo "$VERSION"
	git add .
	git commit -m "version ${VERSION}"
	git tag -a "${VERSION}" -m "version ${VERSION}"
	git push
	git push --tags

build:
	docker build --force-rm=true -t ${IMAGE}:latest .

run:
	bin/run.sh

save:
	docker save ${IMAGE} -o gymbox36.tar

load:
	docker load -i gymbox38.tar

ps:
	docker ps -a

push:
	# You should `docker login` before make push
	docker tag ${IMAGE}:latest ${IMAGE}:${VERSION}
	docker push ${IMAGE}:${VERSION}


clean:
	rm *~

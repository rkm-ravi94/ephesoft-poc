build:
	docker build --no-cache -t ephesoft/jenkins .

run:
	docker rm -f ephesoft_jenkins || true
	docker run -it -P -d --name ephesoft_jenkins  ephesoft/jenkins

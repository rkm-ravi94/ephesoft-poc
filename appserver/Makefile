build:
	docker build --no-cache -t ephesoft/appserver .

run:
	docker rm -f ephesoft_appserver || true
	docker run -it -P -d --name ephesoft_appserver ephesoft/appserver

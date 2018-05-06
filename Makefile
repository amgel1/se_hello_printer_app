.PHONY: test test_api

SERVICE_NAME=hello-world-printer

deps:
	pip install -r requirements.txt && \
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test --verbose -s

run:
	python main.py

test_smoke:
	curl -I --fail 127.0.0.1:5000

docker_build:
	docker build -t $(SERVICE_NAME) .

docker_run: docker_build
		docker run \
		--name hello-world-printer-dev \
		-p 5000:5000 \
		-d $(SERVICE_NAME)
test_cov:
	PYTHONPATH=. py.test --verbose -s --cov=.
test_xunit:
	PYTHONPATH=. py.test -s --cov=. --junit-xml=test_results.xml
test_api:
	python test_api/lalala.py

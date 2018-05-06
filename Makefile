.PHONY: test test_api test_ui

SERVICE_NAME=hello-world-printer

deps:
	pip install -r requirements.txt && \
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test --verbose -s  --ignore=test_ui

run:
	python main.py

test_smoke:
	curl -I --fail 127.0.0.1:5000

docker_build:
	docker build -t $(SERVICE_NAME) .
test_ui:
	py.test test_ui/test_ui.py

docker_run: docker_build
		docker run \
		--name hello-world-printer-dev \
		-p 5000:5000 \
		-d $(SERVICE_NAME)
test_cov:
	PYTHONPATH=. py.test --verbose -s --cov=.  --ignore=test_ui

test_xunit:
	PYTHONPATH=. py.test -s --cov=. --junit-xml=test_results.xml --ignore=test_ui

test_api:
	python test_api/lalala.py

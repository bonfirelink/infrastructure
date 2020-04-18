.PHONY: setup
setup:
	pipenv install --dev

.PHONY: lint
lint:
	pipenv run --\
		yamllint .&&\
		ansible-lint

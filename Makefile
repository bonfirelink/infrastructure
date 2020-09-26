.PHONY: setup
setup:
	pipenv install --dev

.PHONY: lint
lint:
	pipenv run -- yamllint .
	pipenv run -- ansible-lint

.PHONY: pass-save
pass-save:
	bin/pass.sh save

.PHONY: pass-clean
pass-clean:
	bin/pass.sh clean

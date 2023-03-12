.PHONY: test
test:
	flutter test -r expanded --coverage
	lcov --list ./coverage/lcov.info
	genhtml ./coverage/lcov.info -o ./coverage/html

.PHONY: lint
lint:
	dart analyze

.PHONY: fmt
fmt:
	dart format ./lib

.PHONY: test
test:
	flutter test -r expanded --coverage
	mv ./coverage/lcov.info ./coverage/lcov.base.info
	lcov --list ./coverage/lcov.base.info
	genhtml ./coverage/lcov.base.info -o ./coverage/html

# https://github.com/flutter/flutter/tree/main/packages/integration_test#usage
.PHONY: test-ui
test-ui:
	flutter test integration_test/main_test.dart -r expanded --coverage --merge-coverage
	genhtml ./coverage/lcov.info -o ./coverage/html

.PHONY: lint
lint:
	dart analyze

.PHONY: fmt
fmt:
	dart format ./lib

init:
	# Install bundler if not installed
	if ! gem spec bundler > /dev/null 2>&1; then\
  		echo "bundler gem is not installed!";\
  		-sudo gem install bundler -v "1.17.3";\
	fi
	-bundle update
	-bundle install --path .bundle
	-bundle exec pod repo update
	-bundle exec pod install
	# -bundle exec generamba template install

build:
	bundle exec fastlane build clean:true

example_build:
	cd Example
	bundle exec fastlane example_build clean:true

pod:
	bundle exec pod install

coordinator:
	bundle exec generamba gen $(modName) surf_mvp_coordinator

screen:
	bundle exec generamba gen $(modName) surf_mvp_coordinatable_module --module_path 'SurfPlaybook/Example/SurfPlaybookEmaple/Flows/$(flowName)'

alert:
	bundle exec generamba gen $(modName) surf_mvp_coordinatable_alert --module_path 'SurfPlaybook/Example/SurfPlaybookEmaple/Flows/$(flowName)'

# COLORS
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)


TARGET_MAX_CHAR_NUM=20
## Show help
help:
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-$(TARGET_MAX_CHAR_NUM)s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
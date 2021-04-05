build_first_deployment:
	./build_first_deployment.sh

validate_ci: # This expect a ./circleci/config.yml file
	circleci config validate

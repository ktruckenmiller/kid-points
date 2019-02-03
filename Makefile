deploy:
	docker run -it --rm \
		-e IAM_ROLE=arn:aws:iam::601394826940:role/admin \
		-w /work \
		-v $(shell PWD):/work \
		-e ENVIRON=staging \
		-e GIT_COMMIT=$(shell git rev-parse HEAD --short) \
		ktruckenmiller/ansible \
		ansible-playbook -i ansible_connection=localhost deploy.yml

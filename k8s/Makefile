.PHONY: deploy

bootstrap:
	@echo "Bootstrap FluxCD..."
	@flux bootstrap github \
         --owner=maggnus \
         --repository=quasar-project \
         --path ./k8s/environments/01-quasar-dev \
         --components-extra=image-reflector-controller,image-automation-controller

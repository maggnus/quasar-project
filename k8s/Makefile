.PHONY: deploy

bootstrap:
	@echo "Bootstrap FluxCD..."
	@flux bootstrap github \
         --owner=maggnus \
         --repository=quasar-project \
         --path ./k8s/clusters/quasar/dev \
         --components-extra=image-reflector-controller,image-automation-controller

update:
	@echo "Force FluxCD to reconcile..."
	@flux reconcile kustomization flux-system -n flux-system --with-source

uninstall:
	@echo "Uninstall FluxCD..."
	@flux uninstall --namespace flux-system

.PHONY: deploy

bootstrap:
	@echo "Bootstrap FluxCD..."
	@flux bootstrap github \
         --owner=maggnus \
         --repository=quasar-project \
         --path ./k8s/environments/01-quasar-dev \
         --components-extra=image-reflector-controller,image-automation-controller

update:
	@echo "Force FluxCD to reconcile..."
	@flux reconcile kustomization flux-system -n flux-system --with-source

uninstall:
	@echo "Uninstall FluxCD..."
	@flux uninstall --namespace flux-system

secret:
	@echo "Generate oci secret..."
	@flux create secret oci quasar-project \
         --url=ghcr.io \
         --username=maggnus \
         --password=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 \
         --export
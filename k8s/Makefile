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


validate:
	@echo "Validate kustomizations settings..."
	@kubectl apply -k ./clusters/dev --dry-run=client -o yaml

#fix:
#	@echo "Fix kustomizations settings..."
#	@kustomize edit fix ./clusters/dev
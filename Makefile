MIKROTIK_HCL_FOLDER:=./mikrotik/hcl/
MIKROTIK_SCRIPTS_FOLDER:=mikrotik/scripts

include common.mk

init: 
	$(info PACKER: Init Packer plugins)
	packer init ${MIKROTIK_HCL_FOLDER}

mikrotik-vanilla: validate
	$(info PACKER: Creating Vanilla Mikrotik Snapshot)
	packer build -only=vanilla.hcloud.vanilla ${MIKROTIK_HCL_FOLDER}

.PHONY: mikrotik
mikrotik: 
	$(info PACKER: Creating Final Mikrotik Snapshot)
	cd ./mikrotik && \
		source ./scripts/bootstrap.sh

validate: init
	$(info PACKER: Validating ...)
	packer validate ${MIKROTIK_HCL_FOLDER}

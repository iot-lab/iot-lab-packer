.PHONY: all clean

IOTLAB_VM_BOX ?= builds/iotlab-vm.box

$(IOTLAB_VM_BOX):
	@packer build iotlab-vm.json

all: $(IOTLAB_VM_BOX)

clean:
	@rm -rf builds output-virtualbox-iso

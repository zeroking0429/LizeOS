all: BootLoader Disk.img

BootLoader:
	@echo
	@echo =============== Build Boot BootLoader ===============
	@echo

	make -C 0BootLoader

	@echo
	@echo =============== Build Complete ===============
	@echo

Disk.img: 0BootLoader/BootLoader.bin
	@echo
	@echo =============== Disk Image Build Start ===============
	@echo

	cp 0BootLoader/BootLoader.bin Disk.img

	@echo
	@echo =============== All Build Complete ===============
	@echo

clean:
	make -C 0BootLoader clean
	rm -f Disk.img

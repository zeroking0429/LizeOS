all: BootLoader Kernel32 Disk.img

BootLoader:
	@echo
	@echo =============== Build Boot BootLoader ===============
	@echo

	make -C 0BootLoader

	@echo
	@echo =============== Build Complete ===============
	@echo

Kernel32:
	@echo
	@echo =============== Build 32Bit Kernel ===============
	@echo

	make -C 1Kernel32

	@echo
	@echo =============== Build Complete ===============
	@echo

Disk.img: BootLoader Kernel32
	@echo
	@echo =============== Disk Image Build Start ===============
	@echo

	cat 0BootLoader/BootLoader.bin 1Kernel32/VirtualOS.bin > Disk.img

	@echo
	@echo =============== All Build Complete ===============
	@echo

clean:
	make -C 0BootLoader clean
	make -C 1Kernel32 clean
	rm -f Disk.img

.PHONY: run
run: all
	@echo "Y2038 on 64-Bit machine"
	./y2038-64
	@echo
	@echo "Y2038 on 32-Bit machine"
	./y2038-32
	@echo
	@echo "Y2038 on 32-Bit machine with fixes"
	./y2038-32-fixed

.PHONY: all
all: y2038-64 y2038-32 y2038-32-fixed

.PHONY: clean
clean:
	rm -f y2038-64 y2038-32 y2038-32-fixed

y2038-64: y2038.c
	$(CC) -m64 -o $@ $^

y2038-32: y2038.c
	$(CC) -m32 -o $@ $^

y2038-32-fixed: y2038.c
	$(CC) -m32 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 -o $@ $^

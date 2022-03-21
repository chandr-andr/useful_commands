no-warnings:
	! make -n  2>&1 >/dev/null | grep warning  # проверка отсутствия warnings

.PHONY: envfile
 envfile: no-warnings ## Сгенерировать файл из переменных окружения с префиксом ANTARES
	 env | egrep '^ANTARES_' > .gen.env && echo '.gen.env сгенерирован' || touch .gen.env
	 test -f .env && cat .env > .gen.env || true

.PHONY: runrmq
runrmq: envfile # run rmq server localy
	docker compose -f /Users/aleksandrkiselev/Desktop/Projects/basic_commands/rmq/docker-compose.yml up -d

.PHONY: runredis
runredis: envfile
	docker compose -f /Users/aleksandrkiselev/Desktop/Projects/basic_commands/redis/docker-compose.yml up -d

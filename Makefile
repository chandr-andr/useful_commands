no-warnings:
	! make -n  2>&1 >/dev/null | grep warning  # проверка отсутствия warnings

.PHONY: runrmq
runrmq: 
	docker compose -f /Users/aleksandrkiselev/Projects/useful_commands/rmq/docker-compose.yml up -d

.PHONY: runredis
runredis: 
	docker compose -f /Users/aleksandrkiselev/Projects/useful_commands/redis/docker-compose.yml up -d

.PHONY: 
runpsql: envfile
	docker compose -f /Users/aleksandrkiselev/Projects/useful_commands/psql/docker-compose.yml up -d

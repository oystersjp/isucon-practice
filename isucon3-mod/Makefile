.PHONY: up down logs bench restart

up:
	docker-compose up -d --build

down:
	docker-compose down

logs:
	docker-compose logs -f

restart:
	nginx -s reload

BENCH=/home/isucon/qualifier_bench/qualifier_bench
WORK_LOAD=1
INIT=./init.sh
bench:
	$(BENCH) benchmark --workload $(WORK_LOAD) --init $(INIT)

SLOW_LOG=/tmp/mysql-slow.log
restart:
	$(MAKE) -C app build && sudo supervisorctl restart isucon-app
	sudo bash -c "echo '' > /var/log/nginx/access.log && echo '' > /var/log/nginx/error.log" && sudo systemctl restart nginx.service
	sudo bash -c "echo '' > $(SLOW_LOG)" && sudo systemctl restart mysqld.service
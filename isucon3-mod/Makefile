.PHONY: up down logs bench restart

up:
	docker-compose up -d --build

down:
	docker-compose down

logs:
	docker-compose logs -f

bench: bin=/opt/isucon3-mod/bench/bench
bench: work_load=1
bench: init=./init.sh
bench:
	sudo ${bin} benchmark --workload ${work_load} --init ${init}

SLOW_LOG=/tmp/mysql-slow.log
restart:
	$(MAKE) -C app build && sudo supervisorctl restart isucon-app
	sudo bash -c "echo '' > /var/log/nginx/access.log && echo '' > /var/log/nginx/error.log" && sudo systemctl restart nginx.service
	sudo bash -c "echo '' > $(SLOW_LOG)" && sudo systemctl restart mysqld.service
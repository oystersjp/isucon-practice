.PHONY: up down logs bench gogo kataribe

up:
	docker-compose up -d --build

down:
	docker-compose down

logs:
	docker-compose logs -f

bench: workload=1
bench: init=./init.sh
bench:
	sudo /opt/isucon3-mod/bench/bench benchmark --workload ${workload} --init ${init}

gogo:
	sudo systemctl stop nginx
	sudo supervisorctl stop isucon-app
	sudo systemctl stop mysqld
	sudo truncate --size 0 /var/lib/mysql/mysql-slow.log
	sudo truncate --size 0 /var/log/nginx/access.log
	$(MAKE) -C app build
	sudo supervisorctl start isucon-app
	sudo systemctl start mysqld
	sudo systemctl start nginx
	$(MAKE) bench
	$(MAKE) kataribe

kataribe:
	sudo cat /var/log/nginx/access.log | kataribe


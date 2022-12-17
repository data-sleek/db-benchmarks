sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E0C56BD4

echo "deb http://repo.yandex.ru/clickhouse/deb/stable/ main/" | sudo tee /etc/apt/sources.list.d/clickhouse.list

sudo apt update

sudo apt upgrade -y

sudo apt install clickhouse-server clickhouse-client -y

sudo apt-get install awscli -y

sudo service clickhouse-server start

sudo service clickhouse-server status

pass: xxxxx
clickhouse-client --password xxxxx

sudo apt uninstall clickhouse-server clickhouse-client -y
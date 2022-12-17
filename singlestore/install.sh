apt update
apt install -y apt-transport-https

$ sudo root
# ls -al /etc/ssh/
# rm /etc/ssh/<your-ssh-host-keys>
# ssh-keygen -f /etc/ssh/<ssh-host-key-filename> -N '' -t rsa1
# ssh-keygen -f /etc/ssh/<ssh-host-rsa-key-filename> -N '' -t rsa
# ssh-keygen -f /etc/ssh/<ssh-host-dsa-key-filename> -N '' -t dsa

wget -O - 'https://release.memsql.com/release-aug2018.gpg'  2>/dev/null | sudo apt-key add - && apt-key list
apt-cache policy apt-transport-https
sudo apt -y install apt-transport-https
echo "deb [arch=amd64] https://release.memsql.com/production/debian memsql main" | sudo tee /etc/apt/sources.list.d/memsql.list
sudo apt update && sudo apt -y install singlestoredb-toolbox singlestore-client singlestoredb-studio

sdb-deploy cluster-in-a-box --license BDg0YThlY2ExYjdkMzQxYjViODNlNTI1MTczZGQyMDZmAAAAAAAAAAAEAAAAAAAAAAwwNAIYF2ZCWaJSDdJuNvvJnK3ssIoVCgg0B8zSAhh6fYW5TgqmX42xsko6HZpmHHy58QlMTyQAAA== \
--version 7.6 --password Tibeun1111




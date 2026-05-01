sudo apt update && sudo apt upgrade -y
sudo apt install -y git
sudo apt install -y curl software-properties-common gnupg2
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x dotnet-install.sh
./dotnet-install.sh --version latest
echo 'export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools' >> ~/.bashrc
source ~/.bashrc
sudo apt install -y postgresql postgresql-contrib
sudo -u postgres psql -c "CREATE USER myuser WITH PASSWORD 'mypassword';"
sudo -u postgres psql -c "CREATE DATABASE mydatabase OWNER myuser;"
psql -h 127.0.0.1 -U myuser -d mydatabase -W
sudo apt install -y redis-server
sudo systemctl enable redis-server --now
redis-cli ping
sudo apt install -y erlang-nox rabbitmq-server
sudo systemctl enable rabbitmq-server --now
sudo rabbitmq-plugins enable rabbitmq_management
sudo rabbitmqctl status
wget https://dl.min.io/server/minio/release/linux-amd64/minio
chmod +x minio
sudo mv minio /usr/local/bin/
sudo mkdir -p /var/lib/minio/data
sudo useradd -r minio-user -s /sbin/nologin
sudo chown -R minio-user:minio-user /var/lib/minio/data
sudo nano /etc/default/minio
sudo nano /etc/postgresql/13/main/postgresql.conf
sudo nano /etc/postgresql/13/main/pg_hba.conf
sudo systemctl restart postgresql
sudo systemctl status postgresql
clean
clear
ss -nlt | grep 5432
sudo systemctl status postgresql
ls /etc/postgresql/
sudo systemctl start postgresql@13-main
sudo systemctl status postgresql@13-main
sudo nano -c /etc/postgresql/13/main/postgresql.conf
sudo nano -c /etc/postgresql/13/main/pg_hba.conf
sudo systemctl restart postgresql@13-main
sudo journalctl -u postgresql@13-main -n 20 --no-pager
sudo nano -c /etc/postgresql/13/main/postgresql.conf
sudo nano -c /etc/postgresql/13/main/pg_hba.conf
grep -v '^#' /etc/postgresql/13/main/postgresql.conf | grep -v '^$'
grep -v '^#' /etc/postgresql/13/main/pg_hba.conf | grep -v '^$'
sudo systemctl restart postgresql@13-main
sudo systemctl status postgresql@13-main
ss -nlt | grep 5432
sudo apt install ufw -y
# Port for SSH (Always remember this port so you don't lock yourself out of the server!)
sudo ufw allow 22/tcp
# Port for PostgreSQL
sudo ufw allow 5432/tcp    
# Reload and enable
sudo ufw reload
sudo ufw enable
# Port for SSH (Always remember this port so you don't lock yourself out of the server!)
sudo ufw allow 22/tcp
# Port for PostgreSQL
sudo ufw allow 5432/tcp    
# Reload and enable
sudo ufw reload
sudo ufw enable
sudo ufw status
# Windows
Test-NetConnection YOUR_SERVER_IP -Port 5432
# Linux
telnet YOUR_SERVER_IP 5432
sudo nano /etc/systemd/system/api.service
sudo nano /etc/postgresql/13/main/postgresql.conf
sudo nano /etc/postgresql/13/main/pg_hba.conf
sudo systemctl restart postgresql
# Open the port on the server firewall
sudo apt install ufw -y
sudo ufw allow 22/tcp
sudo ufw allow 5432/tcp
sudo ufw enable
sudo -u postgres psql -c "CREATE DATABASE mydatabase;"
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'mypassword';"
sudo -u postgres psql
sudo nano /etc/postgresql/13/main/postgresql.conf
wget https://dl.min.io/server/minio/release/linux-amd64/minio
chmod +x minio
sudo mv minio /usr/local/bin/
sudo mkdir -p /var/lib/minio/data
sudo useradd -r minio-user -s /sbin/nologin
sudo chown -R minio-user:minio-user /var/lib/minio/data
sudo nano /etc/default/minio
sudo nano /etc/systemd/system/minio.service
sudo systemctl daemon-reload
sudo systemctl enable minio --now
sudo ss -tlnp | grep minio
sudo apt update
sudo apt install ansible
sudo apt install sshpass
nano hosts.ini
nano update.yml
ansible-playbook -i hosts.ini update.yml -k -K
nano hosts.ini
ansible-playbook -i hosts.ini update.yml -k -K
export ANSIBLE_HOST_KEY_CHECKING=False
nano hosts.ini
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i hosts.ini update.yml -k -K
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini update.yml -k -K
nano hosts.ini
nano update.yml
ansible-playbook -i hosts.ini update.yml -k -K
nano update.yml
ansible-playbook -i hosts.ini update.yml -k -K
nano hosts.ini
nano update.yml
nano hosts.ini
nano update.yml
ansible-playbook -i hosts.ini update.yml -k -K
sudo nano install_git.yml
ansible-playbook -i hosts.ini install_git.yml -k -K
sudo nano install_dev_tools.yml
ansible-playbook -i hosts.ini install_dev_tools.yml -k -K
sudo nano install_dev_tools.yml
sudo nano main.yml
ansible-playbook -i hosts.ini main.yml -k -K
sudo nano install_minio.yml
sudo nano main.yml
ansible-playbook -i hosts.ini main.yml -K
sudo nano install_minio.yml
ansible-playbook -i hosts.ini main.yml -K

sudo nano install_minio.yml
ansible-playbook -i hosts.ini main.yml -K
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini main.yml -k -K
ansible-vault create secrets.yml
ansible-playbook -i hosts.ini main.yml -K
ansible-vault create secrets.yml
export EDITOR=nano
ansible-vault create secrets.yml
ansible-vault edit secrets.yml
ansible-vault create secrets.yml
ansible-vault edit secrets.yml
ansible-vault update secrets.yml
sudo nano manage-access.yml
ansible-playbook -i hosts.ini manage-access.yml --ask-vault-pass -k -K
sudo nano deploy.yml
sudo nano manage-access.yml
ansible-playbook -i hosts.ini deploy.yml --ask-vault-pass -k -K
sudo nano amin.yml
sudo nano main.yml
ansible-playbook -i hosts.ini deploy.yml --ask-vault-pass -k -K
sudo nano manage-access.yml
sudo nano deploy.yml
ansible-vault update secrets.yml
ansible-vault edit secrets.yml
sudo nano install_minio.yml
ansible-playbook -i hosts.ini main.yml -K
ansible-playbook -i hosts.ini deploy.yml --ask-vault-pass -k -K
ansible-playbook -i hosts.ini main.yml --ask-vault-pass -k -K
ansible-playbook -i hosts.ini deploy.yml --ask-vault-pass -k -K
sudo nano hosts.ini
ansible-vault create secrets.yml
ansible-vault edit secrets.yml
sudo nano deploy.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini deploy.yml -k -K --ask-vault-pass
ansible-vault view secrets.yml
cat secrets.yml
sudo nano manage-access.yml
ansible-playbook -i hosts.ini manage-access.yml --ask-vault-pass -k -K
sudo nano main.yaml
sudo nano main.yml
ansible-playbook -i hosts.ini main.yml --ask-vault-pass -k -K
ls -l
sudo chown Hryshkevich:Hryshkevich *.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini main.yml -k -K --ask-vault-pass
ls -l
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini main.yml -k -K --ask-vault-pass
sudo chmod 644 *.yml
sudo chown Hryshkevich:Hryshkevich *.yml
mv manage_access.yml* manage_access.yml
sudo nano main.yml
sudo nano manage-access
sudo nano manage-access.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini main.yml -k -K --ask-vault-pass
sudo nano install_dev_tools.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini main.yml -k -K --ask-vault-pass
sudo nano deploy.yml
sudo nano install_dev_tools.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini main.yml -k -K --ask-vault-pass
sudo nano deploy.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini main.yml -k -K --ask-vault-pass
sudo nano deploy.yml

sudo nano deploy.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini main.yml -k -K --ask-vault-pass
sudo nano deploy.yml
sudo nano install_dev_tools.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini main.yml -k -K --ask-vault-pass
sudo nano deploy.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini main.yml -k -K --ask-vault-pass
sudo nano deploy.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini main.yml -k -K --ask-vault-pass
sudo nano deploy.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini main.yml -k -K --ask-vault-pass
sudo nano deploy.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini main.yml -k -K --ask-vault-pass
sudo nano postgres_configuration.yml
sudo nano app_depoyment.yml
sudo nano deploy.yml
sudo nano hosts.ini
sudo nano postgres_configuration.yml
sudo nano network_configuration_db.yml
sudo nano main.yml
sudo nano network_configuration_db.yml
sudo nano main.yml
sudo nano hosts.ini
sudo nano network_configuration_db.yml
sudo nano update.yml
sudo nano install_git.yml
sudo nano install_dev_tools.yml
sudo nano install_minio.yml
sudo nano deploy.yml
sudo nano postgres_configuration.yml
sudo nano update.yml
sudo nano postgres_configuration.yml
sudo nano secret.yml
sudo nano deploy.yml
ansible-vault edit secret.yml
ansible-vault create secrets.yml
ansible-vault edit secrets.yml
EDITOR=nano ansible-vault edit secret.yml
EDITOR=nano ansible-vault edit secrets.yml
sudo nano  app_deployment.yml
sudo nano deploy.yml
sudo nano main.yml
ansible-playbook -i hosts.ini update.yml -k -K
ansible-playbook -i hosts.ini update.yml -k
ansible-playbook -i hosts.ini update.yml -K
ansible-playbook -i hosts.ini update.yml -k -K
sudo nano network_configuration_db.yml
ansible-playbook -i hosts.ini update.yml -k -K
export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i hosts.ini update.yml -k -K
ansible-playbook -i hosts.ini install_git.yml -k -K
sudo nano install_git.yml
ansible-playbook -i hosts.ini install_dev_tools.yml -k -K
sudo nano install_dev_tools.yml
ansible-playbook -i hosts.ini install_dev_tools.yml -k -K
sudo nano main.yml
ansible-playbook -i hosts.ini main.yml -k -K
sudo nano main.yml
sudo nano install_minio.yml
ansible-playbook -i hosts.ini main.yml -K
sudo nano hosts.ini
ssh Hryshkevich@20.251.118.172
ansible-playbook -i hosts.ini main.yml -K
ansible-playbook -i hosts.ini main.yml -K -k
sudo nano secrets.yml
sudo nano main.yml
ansible-playbook -i hosts.ini manage-access.yml --ask-vault-pass -k -K
sudo nano manage-access.yml
ansible-playbook -i hosts.ini manage-access.yml --ask-vault-pass -k -K
sudo nano manage-access.yml
ansible-playbook -i hosts.ini manage-access.yml --ask-vault-pass -k -K
sudo nano manage-access.yml
ansible-playbook -i hosts.ini manage-access.yml --ask-vault-pass -k -K
sudo nano manage-access.yml
ansible-playbook -i hosts.ini manage-access.yml --ask-vault-pass -k -K
sudo nano manage-access.yml
ansible-playbook -i hosts.ini manage-access.yml --ask-vault-pass -k -K
sudo nano manage-access.yml
ansible-playbook -i hosts.ini manage-access.yml --ask-vault-pass -k -K
sudo nano manage-access.yml
ansible-playbook -i hosts.ini manage-access.yml --ask-vault-pass -k -K
sudo nano postgres_configuration.yml
ansible-playbook -i hosts.ini postgres_configuration.yml --ask-vault-pass -k -K
sudo nano network_configuration_db.yml 
ansible-playbook -i hosts.ini network_configuration_db.yml --ask-vault-pass -k -K
ssh Hryshkevich@20.100.183.5 "ls /etc/postgresql"
sudo nano network_configuration_db.yml 
ansible-playbook -i hosts.ini network_configuration_db.yml --ask-vault-pass -k -K
sudo nano network_configuration_db.yml 
ansible-playbook -i hosts.ini network_configuration_db.yml --ask-vault-pass -k -K
sudo nano network_configuration_db.yml 
ansible-playbook -i hosts.ini network_confi.yml --ask-vault-pass -k -K
ansible db_servers -i hosts.ini -m shell -a "systemctl status postgresql" -k -K
ansible app_servers -i hosts.ini -m wait_for -a "host={{ hostvars[groups['db_servers'][0]]['ansible_host'] }} port=5432 timeout=5" -k
ansible app_servers -i hosts.ini -m wait_for -a "host=20.100.183.5 port=5432 timeout=10" -k
sudo nano network_configuration_db.yml 
sudo nano update.yml 
cat secrets.yml
ansible-vault view secrets.yml
ansible-vault view secret.yml
EDITOR=nano ansible-vault edit secrets.yml
sudo nano main.yml
sudo nano deploy.yml
ansible-playbook -i hosts.ini main.yml --ask-vault-pass -k -K
sudo nano main.yml
ansible-playbook -i hosts.ini main.yml --ask-vault-pass -k -K

sudo nano manage-access.yml
ansible app_servers -i hosts.ini -m wait_for -a "host=20.100.183.5 port=5432 timeout=10" -k
sudo nano main.yml
ansible-playbook -i hosts.ini main.yml --ask-vault-pass -k -K
sudo nano manage-access.yml
sudo nano main.yml
ansible-playbook -i hosts.ini main.yml --ask-vault-pass -k -K
sudo nano manage-access.yml
ansible-playbook -i hosts.ini main.yml --ask-vault-pass -k -K
sudo nano manage-access.yml
sudo nano network_configuration_db.yml
sudo nano main.yaml
sudo nano main.yml
ansible-playbook -i hosts.ini main.yml --ask-vault-pass -k -K
sudo nano main.yml
sudo nano install_dev_tools.yml
sudo nano manage-access.yml
sudo nano install_dev_tools.yml
ansible-playbook -i hosts.ini main.yml --ask-vault-pass -k -K
ansible app_servers -i hosts.ini -m wait_for -a "host=20.100.183.5 port=5432 timeout=10" -k
nc -zv 20.100.183.5 5432
ansible db_servers -i hosts.ini -m shell -a "grep 'listen_addresses' /etc/postgresql/13/main/postgresql.conf" -k -K
ansible db_servers -i hosts.ini -m shell -a "sudo ufw status" -k -K
ansible db_servers -i hosts.ini -m service -a "name=postgresql state=restarted" -k -K
ansible db_servers -i hosts.ini -m service -a "name=postgresql state=restarted" --become -k -K
sudo nano deploy.yml

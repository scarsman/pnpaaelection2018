#!/bin/bash

#install python requirements
pip install -r pip_modules.txt  > /dev/null 2>&1

DOMAIN="pnpaaelection.mooo.com"
DIRECTORY=/apps/elections
#configure nginx
cat << EOF > /etc/nginx/conf.d/pnpaa.conf
server {
    listen 80;
    server_name "${DOMAIN}";

    location / {
        proxy_set_header Host \$http_host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_pass http://unix:/apps/elections/pnpaaelection.sock;
    }
}
EOF

#create a gunicorn service
cat << EOD > /etc/systemd/system/pnpaaelection.service
[Unit]
Description=pnpaaelection elections service
After=network.target

[Service]
User=www-data
Group=www-data
WorkingDirectory=${DIRECTORY}
Environment="PATH=/usr/local/bin"
ExecStart=/usr/local/bin/gunicorn --workers 3 --bind unix:pnpaaelection.sock -m 007 api:app

[Install]
WantedBy=multi-user.target
EOD

#reload system daemon
/bin/systemctl --system daemon-reload
#reload nginx
/etc/init.d/nginx restart

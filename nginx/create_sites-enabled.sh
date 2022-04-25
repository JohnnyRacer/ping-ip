#!/bin/bash
export EXTERNAL_SERVER_ADDR=192.168.0.1; # Replace with hosting server's external IP.
export EXTERNAL_LISTEN_PORT=8080;
export INTERNAL_SERVER_ADDR=http://127.0.0.1:5000/;
export SITES_ENABLED_NAME=fastapi_nginx;
export host='$host';
export remote_addr='$remote_addr';
export proxy_add_x_forwarded_for='$proxy_add_x_forwarded_for';
echo -e "server {\n
    listen $EXTERNAL_LISTEN_PORT;\n
    server_name $EXTERNAL_SERVER_ADDR;\n
    #    add_header Access-Control-Allow-Origin *;\n
    # add_header Access-Control-Allow-Credentials: true;\n
    add_header Access-Control-Allow-Headers Content-Type,XFILENAME,XFILECATEGORY,XFILESIZE;\n
    add_header access-control-allow-headers authorization;\n
    # Finally, send all non-media requests to the Django server.\n
    location / {\n
        proxy_pass $INTERNAL_SERVER_ADDR; # the uvicorn server address\n
        proxy_set_header   Host             $host;\n
        proxy_set_header   X-Real-IP        $remote_addr;\n
        proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;\n
    }\n
}\n
" > "/tmp/$SITES_ENABLED_NAME";
echo "Nginx config set";
sudo mv /tmp/fastapi_nginx /etc/nginx/sites-enabled;
ls /etc/nginx/sites-enabled
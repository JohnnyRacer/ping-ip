# **ping-ip**
### A barebones API endpoint to get the client IP from behind an Nginx proxy.

This is mainly a test into configuring `nginx` for a reverse proxy. Also quite handy when you can a simple API endpoint to be able to ping for client IPs securely without relying on a third-party IP service like [whatsmyip](whatsmyip.org).

# Getting started

## Dependencies
___
`Requires `nginx` to be installed locally using a package manager (apt, rpm, etc.) or be running in a docker image.`

```bash
fastapi 
passlib
python-dotenv
uvicorn
gunicorn
```

Install pip dependencies by running `pip install -r requirements.txt`
## Running the server
Simply run `python startup.py` to launch an instance of the server on port 3000. If you change the port number, make sure to update the `fastapi_nginx` file in `/etc/nginx/sites-enabled` to the new port number.

## Testing the endpoint
Just run `curl http://{SERVER_IP}:3000/ip ` if you're using the default port, and you should see your client IP.

## TODOs
___
- Add docker support.

- Add logging and simple DB records keeping for the pinged addresses.

- Add endpoint for testing client-server latency.



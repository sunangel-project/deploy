# Deploy Sunangel Backend

## Backend

Just use the `docker-compose.yaml` file provided by this repository.
To start all the components, run

``` sh
docker compose --profile all up -d
```

## SSL

To enable SSL, use `nginx` as a reverse proxy.

1. Link `sunangel-api.conf` to `/etc/ngingx/conf.d/sunangel-api.conf`

`sudo ln -s sunangel-api.conf /etc/ngingx/conf.d/sunangel-api.conf`

2. Reload the config with `sudo nginx -t`
3. Restart `nginx` with `sudo systemctl restart nginx`

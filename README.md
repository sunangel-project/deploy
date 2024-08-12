# Deploy Sunangel Backend

## Automate Deployment

1. Create a file `deploy-$(hostname).sh` with node-specific instructions
2. Link `deploy.sh` to `~/deploy.sh`

`sudo ln -s $(pwd)/deploy.sh ~/deploy.sh`

### Manually Deploy Backend

Just use the `docker-compose.yaml` file provided by this repository.
To start all the components, run

``` sh
docker compose --profile all pull # optional, updates components
docker compose --profile all up -d
```

## SSL

To enable SSL, use `nginx` as a reverse proxy.

1. Link `sunangel-api.conf` to `/etc/nginx/conf.d/sunangel-api.conf`

`sudo ln -s $(pwd)/sunangel-api.conf /etc/nginx/conf.d/sunangel-api.conf`

2. Reload the config with `sudo nginx -t`
3. Restart `nginx` with `sudo systemctl restart nginx`

### Convert .cer to .pem

#### cert.pem

Requires `*certificate.cer`

``` sh
openssl x509 -inform pem -in cloudsftp.de_ssl_certificate.cer -out cert.pem
```

#### key.pem

Requires `*private_key.key`

``` sh
openssl rsa -in cloudsftp.de_private_key.key -text -out key.pem
```

Maybe just renaming is enough

``` sh
cp cloudsftp.de_private_key.key key.pem
```

#### install

Use `scp` to copy cerificates to the server.

``` sh
scp cert.pem user@host:~
scp key.pem user@host:~
```


A setup for nginx connected to php-fpm

* php root configurable through build args


docker-compose example:

```
    ws_nginx:
        build:
            context: ./nginx
            dockerfile: ./Dockerfile
        environment:
             config_handle: symfony4  
             # config specific settings 
             phpfpm_host: php
             phpfpm_port: 9000
             document_root: /var/www/html/public
        labels:
            - "traefik.frontend.rule=Host:myhost.dev.cc"
        networks:
            - default
            - internal
        depends_on:
            - php
        volumes:
            - ./:/var/www/html:ro
```


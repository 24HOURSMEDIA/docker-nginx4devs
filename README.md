# 24hoursmedia/nginx-4devs

Development environments with nginx running in docker.

This docker setup runs nginx alpine and aims for 'minimal-config' (i.e. no custom Dockerfiles, just use docker-compose).
You can configure nginx by passing environment variables.

## Supported applications

By default, minimal-configuration examples are provided for:

- *symfony4*: nginx/php-fpm with Symfony 4
- *symfony3*: nginx/php-fpm with Symfony 3
- *craft3*: nginx/php-fpm with Craft CMS 3
- *craft2*: nginx/php-fpm with Craft CMS 2
- *php*: nginx/php-fpm with just php

Specify the config handle in the environment variable config_handle.

## Examples

See the [examples](examples) directory for some common configuration examples.

### docker-compose example

Run symfony 4 (mount the project dir to /var/www/html)

```
version: '3.7'

services:
  
  nginx:
    image: 24hoursmedia/nginx4devs:latest
    environment:
      config_handle: symfony4
    ports:
      - 8803:80
    depends_on:
      - php
    volumes:
      - ./html:/var/www/html:ro

  php:
    image: 24hoursmedia/pfpm73rutor:latest
    volumes:
      - ./html:/var/www/html:ro
```

## Including own modules

You can place .conf files in /etc/nginx/app/*.conf.
They will get included in in the server block by one of the default configurations

## Configuration

You can configure the nginx configuration to use by specifying an environment variable.
The most important variable is 'config_handle', it specifies the template to use.
The other environment variables depend on the template.

### 'symfony4' configuration handle

#### Available environment variables:

| name                      | default              | description                                                                 |
|:--------------------------|:---------------------|:----------------------------------------------------------------------------|
| document_root             | /var/www/html/public | The document root for nginx                                                 |
| phpfpm_host               | php                  | hostname for the php fpm server, usually the service name in docker-compose |
| phpfpm_port               | 9000                 | the port that php-fpm is running on                                         |
| phpfpm_memory_limit       | 256M                 | memory limit for php                                                        |
| phpfpm_max_execution_time | 120                  | php execution time limit                                                    |

### 'craft' configuration handle

#### Available environment variables:

| name                      | default           | description                                                                 |
|:--------------------------|:------------------|:----------------------------------------------------------------------------|
| document_root             | /var/www/html/web | The document root for nginx                                                 |
| phpfpm_host               | php               | hostname for the php fpm server, usually the service name in docker-compose |
| phpfpm_port               | 9000              | the port that php-fpm is running on                                         |
| phpfpm_memory_limit       | 256M              | memory limit for php                                                        |
| phpfpm_max_execution_time | 120               | php execution time limit                                                    |


#!/bin/sh

set -e

# env variables
# config_handle: handle from nginx-conf-tpl

## get a config handle
CONFIG_HANDLE=${config_handle:-default}
CONF_TPL_FILE=/24hoursmedia/ngx-conf-tpl/${CONFIG_HANDLE}.conf
DEFAULTS_FILE=/24hoursmedia/ngx-conf-tpl/${CONFIG_HANDLE}.defaults


if [ -f "$CONF_TPL_FILE" ]
then
  source $DEFAULTS_FILE
  sh /24hoursmedia/utils/env-subst.sh $CONF_TPL_FILE /etc/nginx/conf.d/default.conf
  nginx -g 'daemon off;'
else
  echo "ERROR config file with handle $CONFIG_HANDLE not found."
  echo "Tried to find $CONF_TPL_FILE"
  echo "supported handles:"
  cd /24hoursmedia/ngx-conf-tpl
  ls *.conf | sed 's/\.conf//'
  exit 1
fi


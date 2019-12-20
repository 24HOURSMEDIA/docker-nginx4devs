FROM nginx:1.16-alpine

# you can set an ARG in docker build to point to the PHP service
# in docker-compose:
#  - build:
#       args:
#           phpfpm_host: "myphpservice"

RUN apk add gettext

COPY 24hoursmedia /24hoursmedia

WORKDIR /var/www/html
CMD ["sh", "/24hoursmedia/run.sh"]




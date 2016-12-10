FROM alpine:latest

ENV module_ver=1.1.5 \
    OTP_REALM="Protected Area" \
    OTP_MAX_LINGER=600    			 

ADD ["https://github.com/archiecobbs/mod-authn-otp/archive/${module_ver}.tar.gz", "/tmp/build/src.tar.gz"]

COPY install.sh /tmp
COPY start.sh /

EXPOSE 80

RUN /bin/ash /tmp/install.sh && \
    rm -f /tmp/install.sh && \
    mkdir -p /var/www/localhost/htdocs/auth && \
    chown apache:apache /var/www/localhost/htdocs

CMD /bin/ash /start.sh

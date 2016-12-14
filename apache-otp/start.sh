#!/bin/ash

echo "### Writing configuration file"

cat > /etc/apache2/conf.d/otp.conf <<EOF

LoadModule authn_otp_module "/usr/lib/apache2/mod_authn_otp.so"

<Directory "/var/www/localhost/htdocs/auth">
   AuthType           basic
   AuthName           "${OTP_REALM}"
   AuthBasicProvider  OTP
   Require            valid-user
 
   OTPAuthUsersFile   "/otp/otp-users.txt"
   OTPAuthMaxLinger   ${OTP_MAX_LINGER}
</Directory>

EOF

mkdir -p /run/apache2
exec /usr/sbin/httpd -X


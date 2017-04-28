FROM alpine:3.4
MAINTAINER Winston <bjdhjj@gmail.com>
ADD kcptun /root/kcptun
RUN chmod +x /root/kcptun/server_linux_amd64 /root/kcptun/client_linux_amd64
# set kcptun client config env
ENV remotehost=10.10.10.10 \
    remoteport=4000
ADD entrypoint.sh /usr/sbin
RUN chmod +x /usr/sbin/entrypoint.sh
EXPOSE 443 4000/udp
ENTRYPOINT ["entrypoint.sh"]
CMD ["/root/kcptun/client_linux_amd64","-c","/root/kcptun/client-config.json 2>&1 &"]

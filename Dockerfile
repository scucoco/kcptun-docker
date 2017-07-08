FROM alpine:3.4
MAINTAINER Winston <bjdhjj@gmail.com>
ADD kcptun /root/kcptun
RUN chmod +x /root/kcptun/server_linux_amd64 /root/kcptun/client_linux_amd64
# set kcptun client config env
ENV remotehost=104.250.144.10 \
    remoteport=60602
ADD entrypoint.sh /usr/sbin
RUN chmod +x /usr/sbin/entrypoint.sh
EXPOSE 443 60602/udp
ENTRYPOINT ["entrypoint.sh"]
CMD ["/root/kcptun/client_linux_amd64","-c","/root/kcptun/client-config.json 2>&1 &"]

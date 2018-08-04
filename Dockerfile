FROM fedora:27

ENV NAGIOS_PASSWD nagios

RUN dnf upgrade --refresh -y
RUN dnf install -y httpd nagios nagios-plugins-all nagios-plugins-nrpe supervisor

RUN htpasswd -db /etc/nagios/passwd "nagiosadmin" ${NAGIOS_PASSWD}


COPY cfg/supervisor.conf /etc/supervisord.conf
COPY cfg/nagios.conf /etc/httpd/conf.d/nagios.conf

CMD ["/usr/bin/supervisord"]

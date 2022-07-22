FROM amazonlinux:latest
RUN yum install -y amazon-linux-extras
RUN amazon-linux-extras install python3
RUN pip3 install flask-sock
RUN yum -y install which unzip aws-cli
RUN amazon-linux-extras install nginx1
WORKDIR /spinnyapp
COPY install.txt install.txt
RUN pip3 install -r install.txt
COPY app.py  app.py
COPY start.sh /start.sh
COPY nginx_config.conf /etc/nginx/conf.d/virtual.conf
EXPOSE 80
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]

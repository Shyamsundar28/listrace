FROM Centos:latest
RUN yum -y update
RUN yum -y install nginx
COPY index.html /var/www/html
RUN curl -fsSL https://pkg.jenkins.io/redhat/jenkins.io.key | tee /etc/pki/rpm-gpg/jenkins.io.key && \
    curl -fsSL https://pkg.jenkins.io/redhat/jenkins.repo > /etc/yum.repos.d/jenkins.repo && \
    yum -y install jenkins
CMD service nginx start && \ service jenkins start && \ tail -f /dev/null 
CMD systemctl enable nignix && systemctl enable jenkins

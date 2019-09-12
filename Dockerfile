FROM amazonlinux:2
MAINTAINER Shun.Uchiyama <shun.uchiyama@denen.com>

RUN amazon-linux-extras install nginx1.12

RUN yum install -y bzip2 patch gcc openssl-devel mysql mysql-devel \
 perl-CPAN perl-DBD-MySQL perl-ExtUtils-Embed perl-Crypt-SSLeay \
 tar which expat-devel libxml2-devel

RUN \curl -L https://install.perlbrew.pl | bash && echo "source ~/perl5/perlbrew/etc/bashrc" >> ~/.bashrc

# not work as bash_profile on docker or root user
RUN source ~/.bashrc && perlbrew install perl-5.28.0 && perlbrew switch perl-5.28.0

# not work as bash_profile on docker or root user
RUN source ~/.bashrc && cpan Carton


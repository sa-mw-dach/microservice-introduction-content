FROM quay.io/openshifthomeroom/workshop-dashboard:5.0.1

USER root

COPY . /tmp/src

RUN rm -rf /tmp/src/.git* && \
    chown -R 1001 /tmp/src && \
    chgrp -R 0 /tmp/src && \
    chmod -R g+w /tmp/src && \
    yum install -y vim-enhanced

# Fixed include::
RUN cd /opt/workshop/renderer && \
    rm -rf content && \
    ln -s /opt/app-root/workshop/content

USER 1001

RUN /usr/libexec/s2i/assemble

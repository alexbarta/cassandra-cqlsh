FROM gcr.io/google-samples/cassandra:v14

ENV CASSANDRA_DATA /var/lib/cassandra

RUN sed -i 's|/cassandra_data|/var/lib/cassandra|g' \
  /etc/cassandra/cassandra.yaml

RUN apt-get update && apt-get install --yes \
  python

COPY ./cqlshlib.tgz /tmp

RUN tar zxvf /tmp/cqlshlib.tgz -C /usr/local/lib/python2.7/dist-packages

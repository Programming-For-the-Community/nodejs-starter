FROM rabbitmq:3.13.0-management

COPY rabbitmq.conf /etc/rabbitmq/rabbitmq.conf

EXPOSE 15672
EXPOSE 5672

CMD ["rabbitmq-server"]
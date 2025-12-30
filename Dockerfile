FROM python:3.9.6-alpine

RUN adduser -h /app -S app

WORKDIR /app

COPY requirements.txt app.py /app/
RUN pip install -r requirements.txt && \
  opentelemetry-bootstrap -a install

USER app

ENV OTEL_PYTHON_LOGGING_AUTO_INSTRUMENTATION_ENABLED=true
ENV OTEL_RESOURCE_ATTRIBUTES="service.name=dice-server"
ENV OTEL_EXPORTER_OTLP_ENDPOINT="http://otel-agent:4317"
ENV OTEL_EXPORTER_OTLP_PROTOCOL="grpc"

CMD opentelemetry-instrument \
  --traces_exporter otlp \
  --metrics_exporter otlp \
  --logs_exporter otlp \
  --service_name dice-server \
  flask run -h 0.0.0.0 -p 8080

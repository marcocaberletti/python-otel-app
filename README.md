# python-otel-app

## Run

```console
docker build -t python-otel-app:latest .

docker run -p 8080:8080 --network otel-agent_default python-otel-app:latest
```

## Reference

https://opentelemetry.io/docs/languages/python/getting-started/

# python-otel-app

## Run

```console
docker build -t python-otel-app:latest .

docker run -p 8080:8080 --network otel-agent_default python-otel-app:latest
```

Test:

```console
ab -n 100 -c 5 http://127.0.0.1:8080/rolldice
```


## Reference

https://opentelemetry.io/docs/languages/python/getting-started/

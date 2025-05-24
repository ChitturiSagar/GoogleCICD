from fastapi import FastAPI
from prometheus_client import Counter, generate_latest
from fastapi.responses import PlainTextResponse

app = FastAPI()
REQUEST_COUNT = Counter("app_requests_total", "Total number of requests")

@app.get("/hello")
def hello():
    REQUEST_COUNT.inc()
    return {"message": "Hello from Medicare DevOps App!"}

@app.get("/metrics")
def metrics():
    return PlainTextResponse(generate_latest(), media_type="text/plain")


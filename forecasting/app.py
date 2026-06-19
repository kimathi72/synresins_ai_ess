from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {
        "service": "Synresins Forecast Engine",
        "status": "running"
    }
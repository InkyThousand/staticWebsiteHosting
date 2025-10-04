from fastapi import FastAPI, Request
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from fastapi.responses import HTMLResponse

app = FastAPI(title="AWS Portfolio API")

# Mount static files
app.mount("/static", StaticFiles(directory="static"), name="static")

# Templates
templates = Jinja2Templates(directory="templates")

@app.get("/", response_class=HTMLResponse)
async def home(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})

@app.get("/api/projects")
async def get_projects():
    # Future: Connect to DynamoDB or other AWS services
    return {
        "projects": [
            {
                "id": 1,
                "title": "Static Website Hosting",
                "description": "S3 + CloudFront deployment",
                "technologies": ["S3", "CloudFront", "Route 53"]
            }
        ]
    }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
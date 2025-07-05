from fastapi import FastAPI, File, UploadFile
from fastapi.responses import StreamingResponse
from fastapi.middleware.cors import CORSMiddleware
from PIL import Image
from rembg import remove
import io

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.post("/process-image/")
async def process_image(file: UploadFile = File(...)):
    # Read image bytes
    input_bytes = await file.read()
    
    # Step 1: Remove background
    no_bg = remove(input_bytes)
    
    # Step 2: Convert to grayscale
    img = Image.open(io.BytesIO(no_bg)).convert("L")
    
    # Convert back to bytes
    buf = io.BytesIO()
    img.save(buf, format="PNG")
    buf.seek(0)
    
    return StreamingResponse(buf, media_type="image/png")



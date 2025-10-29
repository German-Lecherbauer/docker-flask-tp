# Base image
        FROM python:3.11-slim

        # Avoid Python writing .pyc files and enable unbuffered logs
        ENV PYTHONDONTWRITEBYTECODE=1             PYTHONUNBUFFERED=1

        # Workdir
        WORKDIR /app

        # Install dependencies first for better layer caching
        COPY requirements.txt ./
        RUN pip install --no-cache-dir -r requirements.txt

        # Copy app source
        COPY . .

        # Expose port
        EXPOSE 8000

        # Healthcheck (simple HTTP GET to the health endpoint)
        HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD python - << 'PY'
import urllib.request, sys
try:
    with urllib.request.urlopen('http://127.0.0.1:8000/health', timeout=2) as r:
        sys.exit(0 if r.status == 200 else 1)
except Exception:
    sys.exit(1)
PY

        # Default command
        CMD ["python", "app.py"]

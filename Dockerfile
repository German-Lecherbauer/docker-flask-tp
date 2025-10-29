## Base image
FROM python:3.11-slim

# Evitar .pyc y logs bufferizados
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Workdir
WORKDIR /app

# Dependencias primero (mejor cache)
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copiar código
COPY . .

# Exponer puerto
EXPOSE 8000

# Healthcheck (one-liner válido)
HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD \
  python -c "import urllib.request as u, sys; sys.exit(0 if u.urlopen('http://127.0.0.1:8000/health', timeout=2).status==200 else 1)"

# Comando por defecto
CMD ["python", "app.py"]


# TP Docker + Git - Mini App Flask

Este trabajo práctico consiste en una pequeña aplicación web con **Flask (Python)** que se ejecuta dentro de un contenedor de **Docker**.  
La idea fue practicar cómo usar Git, crear una imagen personalizada y correr la app en un entorno aislado.

---

## 📂 Archivos principales

- `app.py` → código de la app Flask.  
- `requirements.txt` → dependencias necesarias (solo Flask).  
- `Dockerfile` → pasos para crear la imagen y ejecutar la app.  
- `.dockerignore` / `.gitignore` → archivos a excluir.  
- `README.md` → documentación general del proyecto.

---

## ⚙️ Cómo levantar la app

1. Clonar o descargar el repositorio:
   ```bash
   git clone https://github.com/GLecherbauer/docker-flask-tp.git
   cd docker-flask-tp
   ```

2. Construir la imagen:
   ```bash
   docker build -t glecherbauer/flask-tp:1.0 .
   ```

3. Ejecutar el contenedor:
   ```bash
   docker run --rm -p 8000:8000 -e MESSAGE="Hola! Soy Germán y esto corre en Docker 😎" glecherbauer/flask-tp:1.0
   ```

4. Abrir en el navegador:
   - http://localhost:8000  
   - http://localhost:8000/health

---

## 🧩 Qué hace la app

- Muestra un mensaje configurable desde una variable de entorno (`MESSAGE`).
- Tiene un endpoint `/health` que devuelve `{"status":"ok"}` para probar que está funcionando.
- Corre sobre el puerto 8000.

---

## 🐋 Comandos básicos de Docker usados

```bash
docker build -t <nombre-imagen> .
docker run -p 8000:8000 <nombre-imagen>
docker ps
docker stop <container_id>
```

---

## 🌿 Flujo Git utilizado

```bash
git init
git add .
git commit -m "primer commit"
git branch -M main
git remote add origin https://github.com/GLecherbauer/docker-flask-tp.git
git push -u origin main
```

---

## 📸 Evidencias (para la entrega)

- Captura del build exitoso en Docker.
- Captura del navegador con la app corriendo.
- Captura del repositorio subido a GitHub.

---

## ✍️ Comentario personal

Elegí Flask porque es liviano y simple para este tipo de prácticas.  
La idea principal fue entender el ciclo completo: crear la app, armar el Dockerfile, construir la imagen, correrla y versionar todo con Git.

---

**Autor:** Germán Lecherbauer  
**Usuario GitHub:** [GLecherbauer](https://github.com/GLecherbauer)  
**Materia:** Desarrollo de Software  
**Fecha:** Octubre 2025

# Mi App DevOps - Práctica Final 🚀

Este repositorio contiene la práctica final de DevOps. Consiste en una aplicación web sencilla desarrollada en Python con **Flask**, la cual incluye un flujo completo de Integración y Entrega Continua (CI/CD) utilizando **GitHub Actions**, **Docker** y **Render**.

## 🛠️ Tecnologías Utilizadas

* **Lenguaje:** Python 3.9
* **Framework Web:** Flask
* **Testing:** Pytest
* **Contenedores:** Docker & Docker Hub
* **CI/CD:** GitHub Actions
* **Despliegue (PaaS):** Render

## ⚙️ Estructura del Pipeline (CI/CD)

El pipeline está definido en `.github/workflows/ci-cd.yml` y se ejecuta automáticamente al hacer un `push` a la rama `main`. Consta de dos fases principales:

1. **Test (Integración Continua):**
   * Configura el entorno de Python.
   * Instala las dependencias listadas en `requirements.txt`.
   * Ejecuta las pruebas automatizadas con `pytest` para asegurar que el endpoint principal funciona correctamente.

2. **Build and Deploy (Entrega Continua):**
   * *Nota: Solo se ejecuta si la fase de Test pasa con éxito.*
   * Inicia sesión en Docker Hub.
   * Construye la imagen de la aplicación (`Dockerfile`) y la sube a Docker Hub.
   * Ejecuta un Webhook para notificar a Render y desencadenar el despliegue automático de la nueva versión.

## 🔐 Variables de Entorno / Secrets

Para que el pipeline de GitHub Actions funcione correctamente, es necesario configurar los siguientes **Secrets** en los ajustes del repositorio de GitHub (`Settings > Secrets and variables > Actions`):

* `DOCKER_USERNAME`: Tu nombre de usuario de Docker Hub.
* `DOCKER_PASSWORD`: Tu contraseña o token de acceso de Docker Hub.
* `RENDER_DEPLOY_HOOK`: La URL del webhook proporcionada por Render para disparar el despliegue.

## 💻 Cómo ejecutar el proyecto localmente

### Opción 1: Usando Python directamente

1. Clona este repositorio:
   ```bash
   git clone https://github.com/eudyyuniorramires/mi-app-devops.git
   cd mi-app-devops
   ```
2. Instala las dependencias:
   ```bash
   pip install -r requirements.txt
   ```
3. Ejecuta la aplicación:
   ```bash
   python app.py
   ```
4. Abre tu navegador y visita: `http://localhost:5000`

### Opción 2: Usando Docker

1. Construye la imagen localmente:
   ```bash
   docker build -t mi-app-devops .
   ```
2. Corre el contenedor:
   ```bash
   docker run -p 5000:5000 mi-app-devops
   ```
3. Abre tu navegador y visita: `http://localhost:5000`

## 🧪 Ejecutar Pruebas Locales

Para correr las pruebas unitarias localmente, simplemente ejecuta:
```bash
pytest
```

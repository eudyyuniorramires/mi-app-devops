# Usar una imagen base ligera de Python
FROM python:3.9-slim

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos y requisitos
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copiar el resto del código
COPY . .

# Exponer el puerto
EXPOSE 5000

# Comando para correr la app
CMD ["python", "app.py"]
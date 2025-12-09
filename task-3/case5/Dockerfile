FROM python:3.9-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .
COPY html /html

RUN mkdir -p /app/generated_qrcodes

EXPOSE 5008

CMD ["python", "app.py"]

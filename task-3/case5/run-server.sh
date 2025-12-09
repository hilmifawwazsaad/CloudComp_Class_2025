docker stop qrcode_generator 2>/dev/null
docker rm qrcode_generator 2>/dev/null

mkdir -p generated_qrcodes

docker run -d \
  --name qrcode_generator \
  -p 5008:5008 \
  -v "$(pwd)/generated_qrcodes:/app/generated_qrcodes" \
  qrcode-generator:latest

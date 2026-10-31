
FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV HF_HOME=/data/huggingface

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir .

RUN mkdir -p /data/cache /data/tmp /data/huggingface

ENV CACHE_DIR=/data/cache
ENV TEMP_DIR=/data/tmp
ENV DEVICE=cpu
ENV COMPUTE_TYPE=int8
ENV WHISPER_MODEL=small
ENV TRANSCRIPTION_PROVIDER=faster-whisper
ENV PREFER_CAPTIONS=true

EXPOSE 8080

CMD ["python", "-m", "src.server.mcp_server"]

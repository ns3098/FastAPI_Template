FROM python:3.8-slim AS app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH /app

WORKDIR /app


COPY requirements.txt requirements.txt
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && rm requirements.txt

COPY ./scripts scripts
COPY ./app app

CMD ["sh", "start.sh"]

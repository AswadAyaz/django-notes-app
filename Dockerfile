FROM python:3.11

WORKDIR /app/backend

COPY requirements.txt .

RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python manage.py collectstatic --noinput

EXPOSE 8000

#CMD ["gunicorn", "notesapp.wsgi:application", "--bind", "0.0.0.0:8000"]

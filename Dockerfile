# -------- Stage 1: Build Environment --------
FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install --user -r requirements.txt

# -------- Stage 2: Final Environment --------
FROM python:3.11-slim

ENV PATH=/root/.local/bin:$PATH

WORKDIR /app

COPY --from=builder /root/.local /root/.local
COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

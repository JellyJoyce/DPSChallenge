FROM python:3.9-slim
WORKDIR /app
COPY . .
COPY models ./models
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000
RUN pip install gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
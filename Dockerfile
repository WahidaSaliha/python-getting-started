FROM python:3.9-slim
WORKDIR /app

RUN apt update && apt install -y wget unzip \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt install ./google-chrome-stable_current_amd64.deb -y \
    && wget https://storage.googleapis.com/chrome-for-testing-public/131.0.6778.85/linux64/chromedriver-linux64.zip \
    && unzip chromedriver-linux64.zip \
    && mv chromedriver-linux64/chromedriver /usr/bin/chromedriver \
    && chmod +x /usr/bin/chromedriver

COPY . .
RUN pip install -r requirements.txt selenium

CMD ["python", "tests/test_homepage.py"]

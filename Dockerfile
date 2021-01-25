FROM python:3
WORKDIR /usr/src/app
COPY get_products.py ./
COPY requirements.txt ./
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python", "./get_products.py"]

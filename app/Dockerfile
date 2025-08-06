# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install AWS CLI v2
RUN apt-get update \
    && apt-get install -y curl unzip 

# Run app.py when the container launches
CMD ["python", "app.py"]

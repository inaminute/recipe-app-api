# Point to the docker image
FROM python:3.7-alpine

# Set environment variable - It tells the python to run in UNBUFFERED MODE. 
# *Recommended to run in Docker's.
ENV PYTHONUNBUFFERED 1

# Dependencies
COPY ./requirements.txt /requirements.txt

# Install the requried dependencies from the file.
RUN pip install -r /requirements.txt

# Setup a directory to store the source code.
RUN mkdir /app

# Make this as the default working directory
WORKDIR /app

# Copy files from the local app folder to the working dir.
COPY ./app /app

# Create a user. '-D' allows to only run the processes.
RUN adduser -D user
User user
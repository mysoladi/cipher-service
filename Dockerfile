FROM python:3.11.6-alpine

WORKDIR /home/application

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Upgrade pip with a specific version
RUN pip install --upgrade pip==21.3.1

# Install project dependencies
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# Copy project files
COPY ./ciphers_project ciphers_project/

# Change working directory to project directory
WORKDIR /home/application/ciphers_project

# Make entrypoint script executable
COPY ./entrypoint.sh .
RUN chmod +x entrypoint.sh

# Use CMD instead of ENTRYPOINT for flexibility
CMD ["./entrypoint.sh"]

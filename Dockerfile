FROM python:3.10-slim

WORKDIR /app

# Install system dependencies if needed
RUN apt-get update && apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .
COPY requirements.in .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Install the application in editable mode
RUN pip install --no-cache-dir -e .

# Expose the port (Shiny defaults to 8000, but we'll use PORT env var)
EXPOSE 8000

# Set environment variables for production
ENV HOST=0.0.0.0
ENV PORT=8000
ENV LAUNCH_BROWSER=false
ENV RELOAD=false

# Run the application
CMD ["python", "-m", "dp_wizard", "--demo"]


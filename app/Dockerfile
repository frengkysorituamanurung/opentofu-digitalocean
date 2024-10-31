# Use an official Golang image as the build stage
FROM golang:1.18-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files for dependency caching
COPY go.mod go.sum ./
RUN go mod download

# Copy the source code
COPY . .

# Build the Go application
RUN go build -o hello-world-app

# Start a new, minimal image from scratch
FROM alpine:latest

# Set working directory
WORKDIR /root/

# Copy the pre-built binary from the builder stage
COPY --from=builder /app/hello-world-app .

# Expose the application's port
EXPOSE 8081

# Run the application
CMD ["./hello-world-app"]

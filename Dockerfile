# Use an official Node.js runtime as a parent image
FROM node:20

# Set the working directory inside the container for EmployeeProfile
WORKDIR /usr/src/app/EmployeeProfile

# Copy package.json and package-lock.json for EmployeeProfile
COPY EmployeeProfile/package*.json ./

# Install dependencies for EmployeeProfile
RUN npm install

# Copy the rest of the EmployeeProfile source code
COPY EmployeeProfile/ ./

# Reset working directory for Common
WORKDIR /usr/src/app/Common

# Copy package.json and package-lock.json for Common
COPY Common/package*.json ./

# Install dependencies for Common
RUN npm install
COPY Common/ ./
# Reset working directory back to /usr/src/app
WORKDIR /usr/src/app/EmployeeProfile

# Expose the port on which the employee service will run
EXPOSE 8002

# Command to run the employee service (assuming your start script is in EmployeeProfile)
CMD ["npm", "start"]

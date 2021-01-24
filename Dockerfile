# screode/crewlink-server
FROM arm32v7/node:14

# Make a directory for the app, give node user permissions
RUN mkdir /app && chown node:node /app

# Clone Git-Repository
RUN git clone https://github.com/ottomated/crewlink-server.git
RUN cp -a /crewlink-server/. /app/
RUN chown -R node:node /app

# Change to the /app directory *and* make it the default execution directory
WORKDIR /app

# Do all remaining actions as node, and start the image as node
USER node

# Copy the repo contents from the build context into the image
# COPY ./ /app/

# Install NPM packages
RUN yarn install

# Compile project
RUN yarn compile

# Tell the Docker engine the default port is 9736
EXPOSE 9736

# Run the app when the container starts
CMD ["node", "dist/index.js"]

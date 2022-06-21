FROM mcr.microsoft.com/vscode/devcontainers/typescript-node:16

# install ionic
RUN npm install -g @angular/cli @ionic/cli 

# Keep container alive
CMD exec /bin/bash -c "echo Container started ; trap \"exit 0\" 15; while sleep 1 & wait $!; do :; done"

# ionic-devcontainer

A template repository for a vscode devcontainer with ionic, cordova and android build tools.

## Usage

In VSCode, use **Remote-Containers: Clone Repository in Container Volume...** to clone this repository into a container.

Create new projects in the container with the Ionic CLI. Maybe do not init another git repo for the project.

```bash
ionic start myProject blank --no-git
```

Open the folder of the new project in vscode.

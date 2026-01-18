# OpenCoder Multi-Client

A Dockerized environment for running [CodeNomad](https://github.com/NeuralNomadsAI/CodeNomad) and [OpenCode Manager](https://github.com/chriswritescode-dev/opencode-manager) alongside the official [OpenCode](https://opencode.ai) Web UI.

## Services

| Service | Port | Description |
| :--- | :--- | :--- |
| **CodeNomad** | `9898` | A fast, multi-instance workspace for OpenCode. |
| **OpenCode Web** | `3000` | The official OpenCode web interface. |
| **OpenCode Manager** | `5003` | Mobile-first web interface with Git integration. |

## Quick Start

1.  **Configure environment**
    ```bash
    cp .env.example .env
    ```
    Edit `.env` to set your `CODENOMAD_SERVER_PASSWORD`.

2.  **Start the services**
    ```bash
    docker-compose up -d
    ```

2.  **Access the interfaces**
    *   **CodeNomad**: [http://localhost:9898](http://localhost:9898)
    *   **OpenCode Web**: [http://localhost:3000](http://localhost:3000)
    *   **OpenCode Manager**: [http://localhost:5003](http://localhost:5003)

## Configuration

### Authentication
OpenCode requires authentication to access your LLM providers.

1.  Start the containers.
2.  Run the connection command inside the CodeNomad container:
    ```bash
    docker-compose exec codenomad opencode /connect
    ```
3.  Follow the interactive prompts to log in.
4.  Your credentials are persisted in the `opencode-config` volume.

### Workspace
The `workspace/` directory in this repository is mounted to `/workspace` inside the containers. Any projects you put here will be accessible to the agents.

## Deployment

The Docker images are automatically built and published to GHCR:
*   `ghcr.io/chen-ye/codenomad-docker:latest`
*   `ghcr.io/chen-ye/opencode-manager:latest`
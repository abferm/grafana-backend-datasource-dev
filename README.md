# grafana-backend-datasource-dev

This docker image provides an instant development environment for [grafana backend datasource plugins](https://grafana.com/docs/grafana/latest/developers/plugins/backend/).

## Usage
### Initialise Your Plugin
```bash
mkdir my-plugin
cd my-plugin
docker run --rm -it -v $(pwd):/work --workdir /work -v ${HOME}/.gitconfig:/root/.gitconfig abferm/grafana-backend-datasource-dev:latest grafana-toolkit plugin:create ./
```

### Build Your Plugin
All build commands can be run as shown in the [official tutorial](https://grafana.com/tutorials/build-a-data-source-backend-plugin/) within the docker container

#### Start Development Container
Execute on host:
```bash
cd my-plugin
docker run --rm -it -v $(pwd):/work --workdir /work abferm/grafana-backend-datasource-dev:latest
```

#### Download Dependencies and Build
Execute in docker container:
```bash
# Install frontend dependencies and build frontend parts of the plugin to dist directory
yarn install
yarn build

# Update the grafana plugin SDK
go get -u github.com/grafana/grafana-plugin-sdk-go
go mod tidy

# Build the backend binaries
mage -v
```
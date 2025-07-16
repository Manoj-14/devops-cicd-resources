# Prometheus

cmd to start service in mac
```bash
    brew services start prometheus
```

### Installation in mac
```bash
wget https://github.com/prometheus/prometheus/releases/download/v3.4.2/prometheus-3.4.2.linux-amd64.tar.gz

sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus
sudo mkdir /var/lib/prometheus
sudo mkdir -p /etc/prometheus/rules
sudo mkdir -p /etc/prometheus/rules.s
sudo mkdir -p /etc/prometheus/files_sd
sudo tar xvf prometheus-3.4.2.linux-amd64.tar.gz
cd prometheus-3.4.2.linux-amd64/
sudo mv prometheus promtool /usr/local/bin/
prometheus
prometheus --version
sudo mv prometheus.yml /etc/prometheus/prometheus.yml
sudo tee /etc/systemd/system/prometheus.service<<EOF
[Unit]
Description=Prometheus
Documentation=https://prometheus.io/docs/introduction/overview/
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
User=prometheus
Group=prometheus
ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/usr/local/bin/prometheus   --config.file=/etc/prometheus/prometheus.yml   --storage.tsdb.path=/var/lib/prometheus   --web.console.templates=/etc/prometheus/consoles   --web.console.libraries=/etc/prometheus/console_libraries   --web.listen-address=0.0.0.0:9090   --web.external-url=

SyslogIdentifier=prometheus
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo chown -R prometheus:prometheus /etc/prometheus/
sudo chown -R prometheus:prometheus /etc/prometheus/*
sudo chown -R 775  /etc/prometheus/
sudo chown -R 775  /etc/prometheus/*
sudo chown -R prometheus:prometheus /var/lib/prometheus/
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus
sudo systemctl status prometheus
```
### Data collection
- How to send the data to prometheus
- we can add code for the source code using python or ruby
- If we don't have access source code then we create a schedule jobs (not a good solution because it is not scalable)
- we need to install exporter on the servers (HaProxy , cloud watch, SQL or IoT) it is called as scarping
- Push gateway act as temp storage where the app can send the metrics to it but then it has built in exporter(internal exporter)
- Type of exporter
    1. Node Exporter:
        - Every UNIX - Based kernal (Ex: computer is called Node)
        - It is official expoter of prometheus project
        - ex of metrix are CPU, Memory, network I/O
        - node exporter can be exted with pluggable metric collector
        - runs on port 9100
        - install node exporter on your servers (follow installation from official doc)
        - update the `prometheus.yml` file in prometheus server
        - add the job under `scrape_configs` as below
        ```yml
            - job_name: "application server"

                # metrics_path defaults to '/metrics'
                # scheme defaults to 'http'.

                static_configs:
                - targets: ["172.31.92.4:9100"] #use public Ip if in diff network or else use private IP
                # The label name is added as a label `label_name=<label_value>` to any timeseries scraped from this config.
                    labels:
                    app: "prometheus"
        ```
        - Node Exporater as a service
        ```bash
        sudo groupadd --system prometheus
        sudo useradd -s /sbin/nologin  --system -g prometheus prometheus
        sudo mkdir /var/lib/node/
        sudo mv node_exporter /var/lib/node/
        sudo nano /etc/systemd/system/node.service #paste the service code in link https://raw.githubusercontent.com/aussiearef/Prometheus/refs/heads/main/node.service
        sudo chown -R prometheus:prometheus /var/lib/node/
        sudo chown -R prometheus:prometheus /var/lib/node/*
        sudo chmod -R 775 /var/lib/node/
        sudo chmod -R 775 /var/lib/node/*
        sudo systemctl daemon-reload
        sudo systemctl start node
        sudo systemctl enable node
        sudo systemctl status node
        ```
## Data model
- Prometheus store the data as time series
- Every time series is identified by metric name and lables
- Labels are a key and value pair
- Labels are optional `<metric name> {key=value,key=value,...}`

## Data Types (in promQL)
- Scaler :
    - Float (1, 1.5) (includes int)
    - String
- Instant Vectors :
    - Instant vector selectors allow the selection of a set of time series and a single sample value for the each at given timestamp
    - only metrlic name is specified
    - Result can be filtered by providing labels
- Range vectors
    - similar to instant vectors except they select range of samples
## Operators
-  \-, \+ , - , *, / ,%, ^
- BInary operatoe
- set binary operator (only on instant vectors)
    - and (common in 2 instant vectors)
    - or (union on of all instant vector)
    - unless (1st instant vector that is not present on both `)
- functions
    - delta(\<instant vectors>)
    - idelta(\<Range vector>)
    - log2(\<insatnt vector>)
    - log10(\<insatnt vector>)
    - ln(\<insatnt vector>)
    - sort(\<insatnt vector>)
    - sort_desc(\<insatnt vector>)
    - timestamp(\<insatnt vector>)
    - avg_over_time(\<range vector>)
    - sum_over_time(\<range vector>)
    - min_over_time(\<range vector>)
    - max_over_time(\<range vector>)
    - count_over_time(\<range vector>)
- prometheus remote write:
    - allows to send a metrics to other systems, including other instances of Prometheus.

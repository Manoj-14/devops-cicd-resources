# Observability
### Monitoring
- It is colleting and visualising data about systems regularly so the system's health can be viewed and tracked.
- Questions for monitoring are
    - Is service is on?
    - Is service functiong as expected ?
    - Is the service performing well ?
- The data that is collected for monitoring is called **telemetry data** (used to find where the problem might be).
#### Metrics used to measure Devops success
1. Mean time to Detection (MTTD): It is the amount of time, on average, b/w the start of the issue and when teams become aware of it.
2. Mean time to Resolve (MTTR):  It is the amount of time b/w when the issue is detected, and when systems are fixed and operating normally.

#### Methods of Monitoring:
In major of the application there are 3 layers UI Layer, Service Layer, Infrastructure Layer
methods for collecting metrics
1. RED METHOD: Mostly used in service layer and at some exted it is UI Layer:
    - Request oriented method
    - R - Rate(throughput): Request per sec
    - E - Error : request failed
    - D - Duration :  Latancy or Transaction response time
2. USE METHOD: for infra layer
    - U - Utilization : i.e. CPU Usage (%), Disk Space (%)
    - S - Saturation : i.e. Network Queue Length. zero = Good
    - E - Errors : Disk write errors. zer = good
3. Four Golden Signals (introduced by google): includes service layer for some extent in infrs layer
    - This is RED + S : all red method with saturation
4. CORE web vitals (from google): for UI layer
    - very imporent for SEO
    - Largest Contentful paint - time taken to load the website
    - First Input Delay: if sites have input boxed , how much time it take to make them available to take inputs
    - Cumulative Layout Shift : stability of websites

### Observability
- Monitoring is part of Observabilty
- Using Monitoring only results in Toll Sprawling
- Observability is gathering actionable data in way that gives a holistic view of the entire system, and tells us wherem when and why an issue occurs.
- In Observabilty, we make sebc of different types od metrics and data collected from various parts if system

### Types of telemetry data (MELT)
M- Metric, E-Event, L-Log, T-Trace
1. Event: event happed at a given time
2. Metric (Waht us the state of system): Is an aggrigated value representing events in a given period of time (100 bags of chips every min)
3. Log(Why the system is in that state): Value detailed representation of event
4. traces (How the system come to that state or how to fix the issue): Shows the interaction od mocroservices to fulfil request

### Methos of Metric Collection (Push V/s Scrape)
1. Push method: Apps or micro service send metrics to an endpoint , via TCP, UDP, HTTP (graphite)
2. Scrape: Application and Miocroservice provide APIs for the time series database, to read the metrics (Prometheus)

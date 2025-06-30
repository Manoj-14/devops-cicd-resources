# Open Telemetry demo
#### Links
- Github: [Personal](https://github.com/Manoj-14/opentelemetry-demo.git)
- Github: [Official](https://github.com/open-telemetry/opentelemetry-demo.git)
- Documentation: [Open telemetry official](https://opentelemetry.io/docs/)

### Docker Life Cycle
- For this project there is 20 Microservices
- These micro services assignes to multiple development teams
- Typical lifecycle in in 3 stages
    1. Setup Dockerfile
    2. Create a docker image
    3. Create and Run docker container

### Points to remember
- Always run the application locally once to get the process
- Get the points from Developer about the location of build file or other things
- Always go with multi stage Docker file in most cases which helps in reducing the image size and use the lightweight images for running the app in last stage
- `Docker init` this is the cmd that works only id you have Docker desktop
- Make use of docker compose to run services
- `Terraform lifecycle`:
    - terraform init
    - terraform plan
    - terraform apply
- Teraaform backend using S3 and state locking using DynomoDB.
- Always go with modular approach for tf, helps for reusablity
- Requirements for EKS:
    - 2 IAM roles , 1 for control plane and another for node
    - So create a IAM role , attach a policy then create a EKS cluster with that
    - Same as above create IAM role , attach a policy then add a node group to that

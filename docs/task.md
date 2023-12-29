We need to deploy a new web service whose code is hosted on the following Github
repository: https://github.com/juny4ng/simple-golang-api
The application has 2 endpoints:  / and /process.

Your task is to:

- Create the AWS infrastructure to host the web application
- Get the web service deployed and running in a highly available way : at least 2 instances running, and stopping one
  should not cause an outage.
  What we’d like you to provide us:
- An endpoint/URL we can use to test the web service that you deployed
- A way to automate the provisioning of the infra and the deployment of the application.

Choose the solutions and technologies that you feel the most comfortable with. The goal of the exercise is to later
discuss with you how you did things and why, not to judge you based on whether you used EC2 instances vs ECS vs
Kubernetes vs Docker vs Lambda, or script vs configuration management tool … and so on. There is more than one way of
doing things!
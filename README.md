# Practical section

## Deploy
1- `terraform init`
2- `terrafom apply`

## Used tools
1- docker
2- terraform 


## For scaling and high availability
We need to use Kubernetes cluster to help in autoscaling and monitoring 
For example we can have number of containers for app, to be distributed on more than one machine and a loadbalancer 
and the same for the database but we need to take care of how we will write and read 
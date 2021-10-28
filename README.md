## Minimal terraform configuration for run ec2 instance

### First running

```
$ terraform init
```
Create s3 bucket

```
$ terraform apply -target=aws_s3_bucket.terraform_state
```

In file main.tf uncomment backend "s3" section and run command

```
$ terraform init
```

### Apply terraform

```
$ terraform apply
```
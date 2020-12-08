Deployment Documentation

• Deployment diagram & explanation.
Check File in Repo called : Scopic - DevOps.pdf

• Explain how the application will scale.
By Using Autoscaling group called "example-autoscaling" based on Alarm when CPU load increased of EC2 instance.

• Explain what security steps are considered if any.
Create VPC private subnet - Deploy RDS on private subnet - Create a private connection between SG of RDS and SG of ELB as so on.

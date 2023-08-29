# Using the Terraform Module for S3 Static Website with CloudFront and SSL certificate

## Overview

This documentation provides step-by-step instructions for using the Terraform module to set up a static website hosted on Amazon S3 and fronted by Amazon CloudFront with SSL certificate. This module simplifies the process and allows you to quickly deploy a globally distributed website.

## Features

**High Availability** : The setup leverages Amazon S3 for hosting the static website content, ensuring high availability and reliability through Amazon's redundant storage infrastructure.

**Global Content Distribution**: Amazon CloudFront acts as a content delivery network (CDN), distributing your website's content to edge locations worldwide. This significantly reduces latency and improves the website's load times for users across the globe.

**HTTPS Support**: The setup includes integration with Amazon Certificate Manager (ACM) for SSL/TLS certificates. This allows your website to be accessed securely over HTTPS, ensuring data integrity and user trust.

**Custom Domain Support**: You can easily associate a custom domain with your website. The Terraform module allows you to specify CloudFront aliases (CNAMEs) to make your website accessible using your own domain name.

**Automatic HTTP to HTTPS Redirection**: The CloudFront distribution is configured to automatically redirect HTTP requests to HTTPS, enhancing security and compliance with modern web standards.

**Caching and Performance Optimization**: CloudFront provides caching capabilities, reducing the load on your S3 bucket and improving website performance. You can configure caching settings to control how frequently CloudFront retrieves content from the origin.

**Minimized Latency**: With CloudFront's edge locations, your website's content is stored closer to your users, resulting in reduced latency and faster page load times.

**Simple Deployment**: The Terraform module abstracts the complexities of configuring the S3 bucket, CloudFront distribution, ACM certificates, and associated resources. This simplifies the deployment process and ensures consistency in setting up the infrastructure.

**Scalability**: The setup can handle varying levels of traffic due to the scalability of both S3 and CloudFront. As user traffic increases, the resources automatically scale to accommodate the demand.

**Cost Efficiency**: By utilizing AWS services like S3 and CloudFront, you can benefit from a pay-as-you-go model, where costs are incurred only for the actual usage and traffic.

**Versioning and Rollbacks**: Amazon S3 supports versioning, allowing you to maintain different versions of your static website content. This can be useful for rollbacks or testing changes.

**Simplified Maintenance**: With the Terraform module, managing and updating the infrastructure becomes easier. You can make changes to your setup by modifying the module's configuration and applying the changes using Terraform.

Overall, this setup provides a robust, secure, and performant solution for hosting static websites, making them accessible globally with improved speed and reliability.

## Installation and Configuration

### Prerequisites

Before you begin, ensure you have the following prerequisites:

**AWS Account**: You need an active AWS account with appropriate permissions to create resources.

**Terraform Installed**: Make sure you have Terraform installed on your local machine. 

### Steps

**1. Configure the Module**
Open the "s3_static_cloudfront.tfvars" file in your preferred text editor. This file should contain inputs for modules located in "main.tf" file. Modify the necessary variables according to your project requirements.

**2. Initialize Terraform**
Navigate to the directory containing the module configuration and run the following command to initialize Terraform:

```sh
terraform init
```
**3. Preview the Changes**
Run the following command to preview the changes that Terraform will apply:

```sh
terraform plan -var-file s3_static_cloudfront.tfvars
```

This step helps you verify that the module will create the expected resources.

**4. Apply the Configuration**
If the preview looks good, apply the configuration to create the resources:

```sh
terraform apply -var-file s3_static_cloudfront.tfvars
```

Type "yes" when prompted to confirm the changes.

**5. Access your Website**
After Terraform applies the configuration, your static website will be accessible via domain name you cpecified in "s3_static_cloudfront.tfvars".

## Variables
This Terraform module supports the following variables:

| Variable | Description |
| ------ | ------ |
| region | The AWS region |
| name | The name and tag of the S3 bucket and also tag for CloudFront. |
| domain_name | The domain_name used for CloudFront distribution and for ACM certificate |
| allowed_methods| Allowed HTTP methods for CloudFront. |

### Conclusion
Congratulations! You've successfully set up a static website hosted on Amazon S3 and accelerated by Amazon CloudFront with SSL certificate using the provided Terraform module. This module abstracts the complexity and enables you to quickly deploy your website with minimal configuration.

For advanced configuration options and additional settings, refer to the module's documentation [Cloudposse AWS CloudFron with S3][PlGh], the official [Terraform AWS provider documentation][PlDb] and [AWS CloudFront documentation][PlGd].

Remember to adapt the instructions and placeholders to match your specific module's structure and variables. This guide provides a general overview of how to use your Terraform module for setting up an S3 static website with CloudFront and SSL certificate.

[PlGh]: <https://github.com/cloudposse/terraform-aws-cloudfront-s3-cdn>
[PlDb]: <https://registry.terraform.io/providers/hashicorp/aws/latest>
[PlGd]: <https://repost.aws/knowledge-center/cloudfront-serve-static-website>
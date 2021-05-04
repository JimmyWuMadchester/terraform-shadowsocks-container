# terraform-shadowsocks-container

Terraform configurations for creating Azure containers as Shadowsocks servers

# Instructions

1. Run the following commands.

```bash
terraform init
terraform plan -out=testplan
```

2. Provide values for variables

```bash
var.dns_name_label
  The subdomain name for ss servers

  Enter a value: 

var.prefix
  The prefix used for all resources in this example

  Enter a value: 

var.ss_password
  Password for your Shadowsocks connections

  Enter a value: 
```

3. Apply the change

```bash
terraform apply "testplan"
```

4. Use the outputs in your Shadowsocks clients

```bash
encryption_algo = "chacha20-ietf-poly1305"
public_ips = [
  "dddsss.eastus.azurecontainer.io",
  "dddsss.japaneast.azurecontainer.io",
  "dddsss.uksouth.azurecontainer.io",
]
ss_port = "6443"
```

5. Destroy the resources

```bash
terraform destroy
```
# Personal-Ansible-Public


Run the according script:

Fast less secure way:

`bash <(curl -fsSL https://raw.githubusercontent.com/nickobard/Personal-Ansible-Public/main/<script-name>.sh)`

More secure way (inspect the code):

```shell
curl -fsSLO https://raw.githubusercontent.com/nickobard/Personal-Ansible-Public/main/<script-name>.sh | bash

chmod +x <scrit-name>.sh

./<script-name>.sh
```

Client set up:

`curl -fsSL https://raw.githubusercontent.com/nickobard/Personal-Ansible-Public/main/bootstrap-client.sh | bash`

Pi5 set up:

`curl -fsSL https://raw.githubusercontent.com/nickobard/Personal-Ansible-Public/main/bootstrap-pi.sh | bash`
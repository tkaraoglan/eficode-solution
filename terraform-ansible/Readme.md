# Weatherapp

This is my Terraform + Ansible solution of Eficode code challange.

## Prerequisites

- An openweathermap API key.
- AWS Account
- Terraform installed or install from [here](https://learn.hashicorp.com/tutorials/terraform/install-cli)
    

### My Solution

This solution is for eficode+ folder, you can follow the same instructions for eficode folder.

* first we clone folder from Github.

```
git clone https://github.com/tkaraoglan/eficode-solution.git
```
* secondly , change directory to eficode folder;
        
```
cd cd eficode-solution/terraform-ansible/eficode+
```

* now you should see a lot of *.tf files in this folder, we will use this file a little bit later.

## before start important note

we have to secure ourselfs. there are good ways for this but we choose three of them.

A- 
```
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"
```

B-

Secondly you can try the AWS Profile. You can add credentials to ~/.aws/credentials file like

[myprofile]
aws_access_key_id     = anaccesskey
aws_secret_access_key = asecretkey

C-

and my favourite is AWS CLI.

you first must install AWS CLI from [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)

```
aws configure
AWS Access Key ID [None]: ENTER-YOUR-ACCESS-KEY-HERE
AWS Secret Access Key [None]: ENTER-YOUR-SECRET-KEY-HERE
Default region name [None]: us-west-2
Default output format [None]: 
```
## now we completed half of the way.

now in the main.tf file we have to specify some variables.

    - 1 ** instance type ** = by default it is t2.large but you can choose economic one by changing it to t2.micro
    - 2 ** your private key path ** = it is obvious. specify it like $HOME/.ssh/ids_rsa.key
    - 3 ** your private key name ** = it is obvious. specify it like ids_rsa
    - 4 ** source folder ** = after clone the github repo you can specify it like $HOME/eficode-solution/terraform-ansible/eficode+/eficode+/ (do not forget last "/" )
    - 5 ** API KEY ** = it is obvious.
    
    

1- now its time to go to start. make sure you are in the right path.
![]()


2- first command

```
terraform init
```



3- now we want to check plan.

```
terraform plan
```


4- the cool part. Apply stage... in this stage terraform ask your approval... after checking the plan we write yes...


6- after a while(depends on your instance type and internet connection, in my case t2.large it takes 10 minutes), you will see completion of creation of plan and you see and output end of the codeline....



7- now check the app by taking this ip and paste it to the browser. TA-DA....



8 - NOW its time to destroy everything.
    


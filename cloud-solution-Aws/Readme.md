# Weatherapp

This is my Cloud(AWS)solution of Eficode code challange.

## Prerequisites

    An openweathermap API key.
    AWS Account

### My Solution

This solution is for eficode+ folder, you can follow the same instructions for eficode folder.

* first we clone folder from Github.

```
git clone https://github.com/tkaraoglan/eficode-solution.git
```
* secondly , change directory to eficode folder;
        
```
cd eficode-solution/docker-solutions/eficode+/
```

* now you should see cloudformation.yml file in this folder, we will use this file a little bit later.


1- now its time to go to AWS cloudformation page.


2- coming up next is using the file which mentioned before, cloudformation.yml

3- After clicking Next button below, next task is filling the gap with appropriate information

- a = stack name whatever you want
- b = instance type = there is three options. if you want faster process you can choose large one(a little bit pricey, consider this please)
- c = keypairname = this is your key name to reach the instance with cli.(probably predefined, if you don't have one you can create from this [link](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
- d = API Key = your Openweather API kEY TO HERE.


    
   then click next.


4- in the next step, you can give tags. then click next.


5- and we come to preview section. control the information and click the "create stack" button.

6- after a while, you will see completion of creation of stack.

7- now check the ec2 status from ec2 page.

8 - when you see the check passed, you can return the cloudformatian page.

9- in cloudformation page you can click the outputs and you should see the link. 

10- when you click... TA-DA....

11- its time to delete all of them. when you click delete it should clear all of things which cloudformation stack creates.
    


# Weatherapp

This is my solution of Eficode code challange.

## Prerequisites

* An [openweathermap](http://openweathermap.org/) API key.
* [Docker](https://www.docker.com/) and [docker compose](https://docs.docker.com/compose/) installed.

## My Solution

This solution is for eficode folder, you can follow the same instructions for eficode+ folder.

* first we clone folder from Github.

```
git clone https://github.com/tkaraoglan/eficode-solution.git
```

* secondly , change directory to eficode folder;

```
cd eficode-solution/docker-solutions/eficode/
```

* thirdly, you have to open .env file with your favourite editor(I prefer vim) and write openweathermap API key to APPID,

```
vim .env
```
```
BACKEND_PORT=9000
BACKEND_ENDPOINT="http://localhost:9000/api"

FRONTEND_PORT=8000
FRONTEND_HOST="0.0.0.0"

APPID="<YOUR API KEY TO HERE>"
MAP_ENDPOINT="http://api.openweathermap.org/data/2.5"
TARGET_CITY="Helsinki,fi"
```

* and finally last command to show the weather page;

```
docker-compose up
```

### this command the process will take five to ten minutes depends on your machine. after code is compiled, you can enter the http://localhost:8000 to your browser.

TA-DA...

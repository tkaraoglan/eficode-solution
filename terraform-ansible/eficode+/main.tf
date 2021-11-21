

module "compute" {
  source = "./compute"
  # by default t2.micro can be used but process will get slower.
  instance_type = "t2.large"
  # your private key path
  private_key_path = "/your/private/key/path"
  # your private key name
  key_name = "your-private-key-name"
  # path of the folder which includes terraform and eficode or eficode+ folder with /
  # something like /your/path/to/eficode/
  source_of_folder = "/your/path/to/eficode/"
  user_data_path   = "${path.root}/user_data.sh"
  # YOUR openweatherapp API KEY is here
  APPID         = "your openweatherapp API Key"
  TARGET_CITY   = "Helsinki,fi"
  MAP_ENDPOINT  = "http://api.openweathermap.org/data/2.5"
  FRONTEND_HOST = "0.0.0.0"
  BACKEND_PORT  = 9000
  FRONTEND_PORT = 8000


}

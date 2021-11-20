

module "compute" {
  source = "./compute"
  # by default t2.micro can be used but process will get slower.
  instance_type = "t2.medium"
  # your private key path
  private_key_path = "/Users/elifvildan/.ssh/tolga.pem"
  # your private key name
  key_name = "tolga"
  # path of the folder which includes terraform and eficode or eficode+ folder with /
  # something like /your/path/to/eficode/
  source_of_folder = "/Users/elifvildan/Desktop/eficode/terraform-ansible/eficode/"
}

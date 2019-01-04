resource "aws_instance" "amber-web" {

  ami             = "${var.ami_win}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ambersg.name}"]
  key_name        = "axs"
  user_data = <<EOF
  <powershell>
  $url = "${var.octo_url}"
  $output = "C:\install"
  $wc1 = New-Object SYSTEM.Net.WebClient
  $octoapi = "${var.octo_api}"
  $octoserver = "${var.octo_server}"
  $role = "${var.octorole}"
  $env = "${var.octoenv}"
  $ipAddress = $wc1.Downloadstring('http://169.254.169.254/latest/meta-data/public-hostname')
  New-Item $output -ItemType Directory
  cd $output
  Invoke-WebRequest -Uri $url -OutFile $output\octo.msi
  Start-Process "octo.msi" -Wait -ArgumentList "/quiet"
  cd "C:\Program Files\Octopus Deploy\Tentacle"
  .\Tentacle.exe create-instance --instance "Tentacle" --config "C:\Octopus\Tentacle.config" --console
  .\Tentacle.exe new-certificate --instance "Tentacle" --if-blank --console
  .\Tentacle.exe configure --instance "Tentacle" --reset-trust --console
  .\Tentacle.exe configure --instance "Tentacle" --home "C:\Octopus" --app "C:\Octopus\Applications" --port "10933" --console
  .\Tentacle.exe configure --instance "Tentacle" --trust "142B8DC3922A94F8407EBAF54749263FC8BB2C4C" --console
  netsh advfirewall firewall add rule "name=Octopus Deploy Tentacle" dir=in action=allow protocol=TCP localport=10933
  .\Tentacle.exe register-with --instance "Tentacle" --publicHostName=$ipAddress --server $octoserver --apiKey=$octoapi --role $role --environment $env --comms-style TentaclePassive --console
  .\Tentacle.exe service --instance "Tentacle" --install --start --console
  </powershell>
  EOF
  
  tags {
    Name = "Octopus Worker"
    Schedule = "kyiv-office-hours"
  }

}



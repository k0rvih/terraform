resource "aws_instance" "amber-web" {

  ami             = "${var.ami_linux}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ambersg.name}"]
  key_name        = "axs"
  user_data = <<EOF
  <powershell>
  $url = "https://download.octopusdeploy.com/octopus/Octopus.Tentacle.3.24.0-x64.msi"
  $output = "C:\install"
  $wc1 = New-Object SYSTEM.Net.WebClient
  #$awsInstanceId = $wc1.Downloadstring('http://169.254.169.254/latest/meta-data/instance-id')
  $ipAddress = $wc1.Downloadstring('http://169.254.169.254/latest/meta-data/public-hostname')
  $ipAddress
  New-Item $output -ItemType Directory
  cd $output
  Invoke-WebRequest -Uri $url -OutFile $output\octo.msi
  msiexec /i octo.msi /quiet
  Start-Sleep -s 20
  cd "C:\Program Files\Octopus Deploy\Tentacle"
  .\Tentacle.exe create-instance --instance "Tentacle" --config "C:\Octopus\Tentacle.config" --console
  .\Tentacle.exe new-certificate --instance "Tentacle" --if-blank --console
  .\Tentacle.exe configure --instance "Tentacle" --reset-trust --console
  .\Tentacle.exe configure --instance "Tentacle" --home "C:\Octopus" --app "C:\Octopus\Applications" --port "10933" --console
  .\Tentacle.exe configure --instance "Tentacle" --trust "142B8DC3922A94F8407EBAF54749263FC8BB2C4C" --console
  netsh advfirewall firewall add rule "name=Octopus Deploy Tentacle" dir=in action=allow protocol=TCP localport=10933
  .\Tentacle.exe register-with --instance "Tentacle" --publicHostName=$ipAddress --server "http://octo.axsdevops.io:81" --apiKey="API-JNF9DYMC7BUVD4TOSEZSQN1XFO" --role "web" --environment "Dev" --comms-style TentaclePassive --console
  .\Tentacle.exe service --instance "Tentacle" --install --start --console
  </powershell>
  EOF
  
  tags {
    Name = "Octopus Worker"
    Schedule = "kyiv-office-hours"
  }

}



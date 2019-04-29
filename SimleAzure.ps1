Add-AzureRmAccount -Subscription "AZU-P00-RA01-NP" 

$resourceGroup = "AZ19D1-ZeroTouch"
$location = "West US 2"
$vmName = "Testing-Mani"

# Create user object
$User = "User01"
$PWord = ConvertTo-SecureString -String "P@sSwOrd" -AsPlainText -Force
$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord
#$cred = Get-Credential -Message "Enter a username and password for the virtual machine." -credential User01

# Create a resource group
#New-AzureRmResourceGroup -Name $resourceGroup -Location $location

# Create a virtual machine
New-AzureRmVM `
  -ResourceGroupName $resourceGroup `
  -Name $vmName `
  -Location $location `
  -ImageName "Win2016Datacenter" `
  -VirtualNetworkName "myVnet" `
  -SubnetName "mySubnet" `
  -SecurityGroupName "myNetworkSecurityGroup" `
  -PublicIpAddressName "myPublicIp" `
  -Credential $cred `
  -OpenPorts 3389
  
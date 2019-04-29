import AzureRMAccount 
Add-AzureRmAccount -Subscription "AZU-P00-RA01-NP" 

$resourceGroup = "AZ19D1-ZeroTouch"
$location = "West US 2"
$vmName = "Testing-Mani"

# Create user object
$cred = Get-Credential -Message "Enter a username and password for the virtual machine."

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
  
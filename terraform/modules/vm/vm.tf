resource "azurerm_network_interface" "test" {
  name                = "${var.webapp_name}-${var.resource_type}-nic"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_address_id
  }
  tags = {
    Project = var.project
  }
}

resource "azurerm_linux_virtual_machine" "test" {
  name                  = "${var.webapp_name}-${var.resource_type}"
  location              = var.location
  resource_group_name   = var.resource_group
  size                  = "Standard_B1s"
  admin_username        = var.vm_admin_username
  network_interface_ids = [azurerm_network_interface.test.id]
  admin_ssh_key {
    username   = "adedaryorh"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDNTrxvbKrx8eSidNwMa3oSZAPMYNPIz7YYaQLWShkl3zrPmRHI4aLcNyQRUOCOh5FM4YTYqOxLa6B/16HIWS/9+r5Ai5nAnCLxUoiNnvA1Y01D3LSAFmiNiGFggQXL2FXNWJjCd2CMH1eCGnhl2sQtBrBmHh+XVqjsFz7hGNDM2UZ/AuSYFYO2IJMFsxas9nWorra+UjSiw0RCfk3uw9xro5Z/7b3b81M3ugbYrGaJuVEOnWHhTTqJUYtw4n1jLAALN+afjGhuw7wFxloYFcXn3VnUxox603VwWchtkYKJceRxpn30eyUSJ+uiXC96R7TJdTpVIxO5No8JyX5cI/YgMTBSV2B77SPohmk0HhWJzyOKBP7bHUQyeLEYNvwNQshzO1akNSoq+SNU13XF+7EWnkN8CiR0l9fkvcDd0Z2Y/M3rnnslS0wFfdB92OSQn4SEmB2TngNFCQWp0F5lNta2WAovQU78G4XNg6FQ8o8LkKnTCVECQTirisMLYidQAT1BpO/FTh4WpvA2/1Q7MDw7J4h7uCoBeg9fl4krChNTS6Z7tgNPiCNc7RT+2/MtLTZgUDaTtMmkhZXdwIxbTDsW5FGDiSsEP9kbIccWiZyRVDNpbwpIzTDkWznbzEo6YXL36MMR83o7k6zDf2dkemFB7MXS3ry+p66Bz5TWs1UqKQ== Welcome@Adedayo-MBP"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  tags = {
    Project = var.project
  }
}

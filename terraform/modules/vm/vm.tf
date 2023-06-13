resource "azurerm_network_interface" "test" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${var.public_ip}"
  }
}

resource "azurerm_linux_virtual_machine" "test" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  size                = "Standard_B1s"
  admin_username      = "Shakirat"
  network_interface_ids = [azurerm_network_interface.test.id,]
  admin_ssh_key {
    username   = "Shakirat"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC2qhmHVNrY/aFNlZkWc0DNvSIvR2zfUzS9LxowSCu1YByWMJhV+3ef4gZgLnXCE4OLHHJy1nH9FtchWEfu3riVga6d8ondKNmVjD3RWbElpDDdwpZDnt/JnFuufj9eri/t//Tk0zX+JAz0KCbyf+OEuLgZfuvof6UDFjhUON/5VBv0zw8nxF3vwkUVpdnb/O93w6ysrgjmZMcsCDnfOB0wQOg+6EWm+e8OgP3Wfr4GBOZh5aR6KKAU47D6xTWhtSKm7DB6wY3aV4a+QvOAAp1kCaasJSOPo/XEaoxIKri2DV3eOUQmiqSk8+JqWs3pc0h6bQWOZ5mM9ZQV7i4FVaSKM+vU/Dbnoiln8qI+FXPGRlzGLwHHdCSuQ2d0VHtr8BdwkLql34D5NOTgs/BWbLzfh8YmM+V2/8W+m46xxSN7xsTIU020kBJYHD8H5/fxKcFne9zUn8jAgeg8RrqR/VTapPIcDHD28MXs1C1bIPx7Au1voCaOkkMQNdKSz37+vJDPldNtq1CuYsfy2tbD1DeDJwQcMo9VbQ5Cjr8fKvo0I469mz2gJUUAgkNQdaithy7mmZ9yJ+xFA0AbXQLw0cddaO22biU34v7R87sbEWLM/zhJy4wWoNTTHWhW/ZfTOMRo60OOxVqfaog8yw71pqjAkO2UNUaAfojJ53TJjOWABQ== bwitl@Yinka"
    #public_key = file(var.vm_public_key) 
     
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

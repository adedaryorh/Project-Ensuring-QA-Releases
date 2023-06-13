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
    username   = "adedaryorh"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCmbKz2TxGbZnbkbjbqt1FRRVnHwXPJP6NDkdXcL2OyxR/5NNzWaoKGUQRDJYzlFbx5teUvnMaSb8LLpXMKRHrRavbfaqD8GJAvzoV+Tgt0RSxiimzwRuyeA8LIRh/oOYWw/iZGrwKpM0yAq2xeoC52x+Zm7W0i3Qij/5W8sYis9zEWKv6+wxTwQFRhneIZNmkC320lGC7/iz8bUIvvWM2M6fwRyxScECfMXWy6CM4XfuqsTqCcAiODvcYeFJgVYEtAOfz48BNtHHnZLcyVNeuNWgfw43arnclL2u/xApNnAelUtNSew4K0Bheegw51E7DcA6ma+nOStEdfDlIyBflxW42TEXKwl4dHHDnwcw1n+/luJ5FKyYqi1x8O8cWYuFIfBenwWzvEQMg/MR5NypzTzi0WIpe0wHIstcKrAIC4jAUfmRzYqLy2D2cYzinVUckedUMgS+/iYHmkEHnsqMDbHwIU9adeuERdQfhFC2WLLeYtn08qUBYEibBcI6ZKrorcDkwaB8emtMmMBCbU4sNpgNdrTZA5NTQ11aB0QeDkYDy9djDiWTujWqWGa75OwJXmmyvbNKLJ93g3Ln5EPXr0ncnQyR4Ey6OngAq9xKeENTHZyxa9VgAy98GjWQKPIp/YQgcAKoTn1ayfxXUGtUCj2YsfmBaP0z0IPH2eIcgiWQ== Welcome@Adedayo-MBP"
     
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

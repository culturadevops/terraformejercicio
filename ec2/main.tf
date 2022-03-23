provider "aws" {
  region=""

}

resource "aws_instance" "ec2demo" {
  ami                     =  "${var.ami}"
  count                   = "${var.count_n}"
  instance_type           = "${var.instance_type}"
  subnet_id               = "${element(var.subnet_id, count.index)}"
  ebs_optimized           = "${var.ebs_optimized}"
  disable_api_termination = "${var.disable_api_termination}"
  key_name                = "${var.key_name}"
  monitoring              = "${var.monitoring}"
  vpc_security_group_ids  = ["${var.vpc_security_group_ids}"]
  iam_instance_profile    = "${var.instance_profile}"
  source_dest_check       = "${var.source_dest_check}"
  user_data               = "${var.user_data}"

  dynamic "root_block_device" {
    for_each = var.root_block_device
    content {
      delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
    }
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      device_name           = lookup(ebs_block_device.value, "device_name", null)
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", null)
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", null)
    }
  }

  tags = {
    Name     = "${var.name_instance}"

    Env      = "${var.env}"
  }

  lifecycle {
    ignore_changes = ["ebs_block_device"]
  }
  }

}
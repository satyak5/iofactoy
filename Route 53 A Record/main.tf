provider "aws" {
    access_key = "AKIAZLAIPODPC4UPNG6H"
    secret_key = "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"
}

resource "aws_instance" "webserver"{
      ami = "ami-2757f631"
      instance_type = "t2.micro"
      user_data = "${file("./file/user_data.sh")}"
}

resource "aws_eip" "webserver-eip"{
      instance = "${aws_instance.webserver.id}"
}

resource "aws_route53_record" "web"{
      zone_id = "${aws_route53_zone.primary.zone_id}"
      name    = "cloudrock.buzz"
      type    = "A"
      ttl     = "60"
      records = ["${aws_eip.webserver-eip.public_ip}"]
}

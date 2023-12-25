resource "aws_elasticache_cluster" "redis" {
  cluster_id = "${var.common.env}-${var.common.project}-redis"
  node_type = var.node_type
  num_cache_nodes = var.num_cache_nodes
  port = var.port
  engine = var.engine
  cache_subnet_group = aws_elasticache_subnet_group.cache_subnet_group.name
  security_group = [aws_security_group.sg_redis.vpc]
}

resource "aws_elasticache_subnet_group" "cache_subnet_group" {
    name = "${var.common.env}-${var.common.project}"
    subnet_ids = var.subnet_ids
}

resource "aws_security_group" "sg_redis" {
  name = "${var.common.env}-${var.common.project}-sg-redis"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "TCP"
    security_group = var.redis_sg // allow to access redis via sg
    security_group_id = aws_security_group.sg_redis.id // allow to access redis via (response)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
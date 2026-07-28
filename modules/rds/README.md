# Module: rds

Creates an Amazon RDS DB Instance (`aws_db_instance`).

## Usage

```hcl
module "rds" {
  source = "../../modules/rds"
  name   = "my-rds"
  engine = "postgres"
}
```

## Inputs

| Name                    | Type          | Default            | Description                                    |
|-------------------------|---------------|--------------------|------------------------------------------------|
| `name`                  | `string`      | —                  | Name/identifier for the RDS DB instance.       |
| `allocated_storage`     | `number`      | `20`               | Storage size in GB.                            |
| `max_allocated_storage` | `number`      | `null`             | Upper limit for storage autoscaling (GB).      |
| `storage_type`          | `string`      | `"gp2"`            | Storage type (`gp2`, `gp3`, `io1`, etc.).      |
| `engine`                | `string`      | `"postgres"`       | Database engine (e.g. `postgres`, `mysql`).    |
| `engine_version`        | `string`      | `null`             | Database engine version.                       |
| `instance_class`        | `string`      | `"db.t3.micro"`    | Instance class.                                |
| `db_name`               | `string`      | `null`             | Name of initial database created on instance.  |
| `username`              | `string`      | `"dbuser"`         | Master username.                               |
| `password`              | `string`      | `"dbpassword123!"` | Master password (sensitive).                   |
| `port`                  | `number`      | `null`             | Port for database connections.                 |
| `skip_final_snapshot`   | `bool`        | `true`             | Skip final snapshot before deletion.           |
| `publicly_accessible`   | `bool`        | `false`            | Whether instance is publicly accessible.       |
| `tags`                  | `map(string)` | `{}`               | Tags applied to the DB instance.               |

## Outputs

| Name                   | Description                           |
|------------------------|---------------------------------------|
| `db_instance_id`       | RDS instance ID.                      |
| `db_instance_arn`      | RDS instance ARN.                     |
| `db_instance_endpoint` | Connection endpoint (`address:port`). |
| `db_instance_address`  | Database hostname / address.          |
| `db_instance_port`     | Database port.                        |
| `db_instance_username` | Master username.                      |

## Inspect on Floci

```bash
./scripts/awslocal.sh rds describe-db-instances
```

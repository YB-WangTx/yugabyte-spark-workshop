--login to ycql
./master/bin/ycqlsh `hostname -i`  -u 'cassandra'
password: Yugabyte12#

    > use test;

create table aws_cloudtrail(event_id INT, event_content JSONB, PRIMARY KEY (event_id));

insert into aws_cloudtrail (event_id, event_content) values (1,
'{
    "Records": [
        {
            "eventVersion": "1.0",
            "userIdentity": {
                "type": "IAMUser",
                "principalId": "EX_PRINCIPAL_ID",
                "arn": "arn:aws:iam::123456789012:user/Alice",
                "accessKeyId": "EXAMPLE_KEY_ID",
                "accountId": "123456789012",
                "userName": "Alice"
            },
            "eventTime": "2014-03-06T21:22:54Z",
            "eventSource": "ec2.amazonaws.com",
            "eventName": "StartInstances",
            "awsRegion": "us-east-2",
            "sourceIPAddress": "205.251.233.176",
            "userAgent": "ec2-api-tools 1.6.12.2",
            "requestParameters": {
                "instancesSet": {
                    "items": [
                        {
                            "instanceId": "i-ebeaf9e2"
                        }
                    ]
                }
            },
            "responseElements": {
                "instancesSet": {
                    "items": [
                        {
                            "instanceId": "i-ebeaf9e2",
                            "currentState": {
                                "code": 0,
                                "name": "pending"
                            },
                            "previousState": {
                                "code": 80,
                                "name": "stopped"
                            }
                        }
                    ]
                }
            }
        }
    ]
}');

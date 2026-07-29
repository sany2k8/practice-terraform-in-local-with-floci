import json


def lambda_handler(event, context):
    """Minimal handler that echoes the event back."""
    return {
        "statusCode": 200,
        "body": json.dumps({"message": "Hello from Lambda on Floci!", "event": event}),
    }

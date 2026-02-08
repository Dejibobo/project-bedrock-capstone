import json

def lambda_handler(event, context):
    # S3 event may contain multiple records
    records = event.get("Records", [])
    for r in records:
        s3 = r.get("s3", {})
        bucket = s3.get("bucket", {}).get("name", "unknown-bucket")
        key = s3.get("object", {}).get("key", "unknown-key")
        print(f"Image received: {key} (bucket: {bucket})")

    return {
        "statusCode": 200,
        "body": json.dumps({"ok": True, "records": len(records)})
    }

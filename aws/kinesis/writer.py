import boto3
import sys
import time

# This example demonstrates sending a single message to a kineses stream

if __name__ == '__main__':

    client = boto3.client('kinesis')

    try:
        response = client.put_record(StreamName='mystream', Data='mymessage', PartitionKey='customer99')
        print(f'Put succeeded. Shard={response["ShardId"]}. Seq={response["SequenceNumber"]}')
    except Exception as x:
        sys.exit(x)
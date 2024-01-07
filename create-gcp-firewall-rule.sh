#!/bin/sh
gcloud compute firewall-rules create tcp8080 \
    --allow tcp:8080 \
	--source-ranges 0.0.0.0/0 \
	--direction INGRESS \
	--priority 1000
	
#!/bin/bash
kubectl get ingress grpc-ingress | tail -n 1 | awk '{print "{\"host\": \""$4"\"}"}'

---
title: How to exposing TCP services on kubernetes ingress-nginx
author: Nawa
pubDatetime: 2023-09-18T17:17:17.170Z
postSlug: kube-expose-port-tcp
featured: false
draft: false
tags:
  - FAQ
description: How you can add an 'Reading time' in your blog posts of AstroPaper.
---

Kubernetes nginx resource only routing HTTP and HTTPS by default  , ingress-nginx can be configured to receive external TCP/UDP traffic from non HTTP layer eg. redis default port is 6379 and route to internal services using port mappings.


## Table of contents

## Create tcp services config map

Step (1) Create config map with install ingress name space.

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: tcp-services
  namespace: ingress-nginx
data:
  6379: "redis-namespace/redis-service:6379"
```

Step (2) Add port mapping to services load balancer

```yaml
- name: proxied-tcp-6379
    nodePort: 32739
    port: 6378
    protocol: TCP
    targetPort: 6378
```

Step (3) Add arguments to ingress deployment.

```yaml
args:
    - /nginx-ingress-controller
    - --tcp-services-configmap=ingress-nginx/tcp-services
```


## Conclusion
Easy easy. 🙏🏻

#!/bin/sh
npm run build && scp -r ./dist/* root@165.22.252.32:/var/www/html
#!/bin/sh
npm run build && scp -r ./dist/* root@188.166.230.146:/var/www/html
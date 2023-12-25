#!/bin/bash

URL="https://a7da-2401-7400-c806-e423-add0-8557-5b50-a7b6.ngrok-free.app"
USERNAME=maggnus
SECRET=654c266c4f9b4fa022cc57

atlantis server \
--atlantis-url=$URL \
--gh-user=$USERNAME \
--gh-token=$GITHUB_TOKEN \
--gh-webhook-secret=$SECRET \
--repo-allowlist="github.com/maggnus/*"

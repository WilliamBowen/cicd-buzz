#!/bin/sh
echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
if [ "$TRAVIS_BRANCH" = "master" ]; then
  TAG="latest"
else
  TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t willwbowen/cicd-buzz:"$TAG" .
docker push "$TRAVIS_REPO_SLUG"

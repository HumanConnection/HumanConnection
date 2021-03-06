#!/usr/bin/env bash
sed -i "s/<COMMIT>/${TRAVIS_COMMIT}/g" $TRAVIS_BUILD_DIR/scripts/patches/patch-deployment.yaml
sed -i "s/<COMMIT>/${TRAVIS_COMMIT}/g" $TRAVIS_BUILD_DIR/scripts/patches/patch-configmap.yaml
kubectl --namespace=human-connection patch configmap develop-configmap -p "$(cat $TRAVIS_BUILD_DIR/scripts/patches/patch-configmap.yaml)"
kubectl --namespace=human-connection patch deployment develop-backend -p "$(cat $TRAVIS_BUILD_DIR/scripts/patches/patch-deployment.yaml)"
kubectl --namespace=human-connection patch deployment develop-webapp -p "$(cat $TRAVIS_BUILD_DIR/scripts/patches/patch-deployment.yaml)"

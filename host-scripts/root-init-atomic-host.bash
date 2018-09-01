#! /bin/bash

rpm-ostree upgrade
rpm-ostree install \
  cockpit \
  docker-compose \
  git \
  vim-enhanced

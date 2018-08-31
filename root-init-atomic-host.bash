#! /bin/bash

rpm-ostree upgrade
rpm-ostree install \
  docker-compose \
  git \
  vim-enhanced

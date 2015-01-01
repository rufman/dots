#!/usr/bin/env bash

# Temporarily allow pip install in non virtualenv, for setup
export PIP_REQUIRE_VIRTUALENV=false

pip install virtualenv
pip install virtualenvwrapper

export PIP_REQUIRE_VIRTUALENV=true
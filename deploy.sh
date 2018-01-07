#!/bin/bash
bundle && bundle exec rake ${1:-stage}

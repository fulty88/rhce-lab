#!/bin/bash

echo "Unregistering RHEL system..."

subscription-manager remove --all || true
subscription-manager unregister || true
subscription-manager clean || true

echo "Done. Safe to destroy VM."
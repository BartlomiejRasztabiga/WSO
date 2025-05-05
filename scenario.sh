#!/bin/bash

set -e

SCENARIO=$1

if [[ -z "$SCENARIO" ]]; then
  echo "Użycie: ./scenario.sh <numer_scenariusza>"
  exit 1
fi

PLAYBOOK_DIR="./playbooks"
BECOME_OPT="--ask-become-pass"

case "$SCENARIO" in
  1)
    ansible-playbook $BECOME_OPT "$PLAYBOOK_DIR/scenario_1_single_vm.yaml"
    ;;
  2)
    ansible-playbook $BECOME_OPT "$PLAYBOOK_DIR/scenario_2_two_vms_same_network.yaml"
    ;;
  3)
    ansible-playbook $BECOME_OPT "$PLAYBOOK_DIR/scenario_3_two_vms_bridge.yaml"
    ;;
  *)
    echo "Nieznany scenariusz: $SCENARIO"
    echo "Dostępne: 1, 2, 3"
    exit 1
    ;;
esac

#!/usr/bin/env bash
# Ansible Vault password CLI utilities

set -e
progname=$(basename $0)

vault_password_file='.vault_pass.txt'

pass_clean() {
  rm ${vault_password_file}
  echo "${vault_password_file} was deleted"
}

pass_save() {
  local password
  echo 'Input Ansible Vault password:'
  read -r -s password
  echo "${password}" > ${vault_password_file}
  echo "Ansible Vault password stored in ${vault_password_file}"
}

usage() {
  echo "usage: ${progname} COMMAND"
  echo
  echo "Ansible Vault password CLI utilities"
  echo
  echo "Commands:"
  echo "  clean  Delete Ansible Vault password file"
  echo "  save   Prompt Ansible Vault password and store it in ${vault_password_file}"
}

if [[ $# -ne 1 ]]; then
  usage
  exit 1
fi

case "$1" in
  clean)
    pass_clean;;
  save)
    pass_save;;
  -h|--help)
    usage
    exit 0;;
  *)
    usage
    exit 1;;
esac

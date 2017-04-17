_tempest()
{
  local cur prev words
  COMPREPLY=()
  _get_comp_words_by_ref -n : cur prev words

  # Command data:
  cmds='account-generator cleanup complete help init list-plugins run run-stress verify-config workspace'
  cmds_account_generator='-h --help -c --config-file --os-username --os-password --os-project-name --os-tenant-name --os-domain-name --tag -r --concurrency --with-admin -i --identity-version'
  cmds_cleanup='-h --help --init-saved-state --delete-tempest-conf-objects --dry-run'
  cmds_complete='-h --help --name --shell'
  cmds_help='-h --help'
  cmds_init='-h --help --config-dir -c --show-global-config-dir -s --name --workspace-path'
  cmds_list_plugins='-h --help'
  cmds_run='-h --help --smoke --regex -r --list-tests -l --concurrency -w --parallel --serial --subunit'
  cmds_run_stress='-h --help -d --duration -s --serial -S --stop -n --number -a --all -T --type -i --call-inherited -t --tests'
  cmds_verify_config='-h --help -u --update -o --output -r --replace-ext'
  cmds_workspace='-h --help --workspace-path'

  dash=-
  underscore=_
  cmd=""
  words[0]=""
  completed="${cmds}"
  for var in "${words[@]:1}"
  do
    if [[ ${var} == -* ]] ; then
      break
    fi
    if [ -z "${cmd}" ] ; then
      proposed="${var}"
    else
      proposed="${cmd}_${var}"
    fi
    local i="cmds_${proposed}"
    i=${i//$dash/$underscore}
    local comp="${!i}"
    if [ -z "${comp}" ] ; then
      break
    fi
    if [[ ${comp} == -* ]] ; then
      if [[ ${cur} != -* ]] ; then
        completed=""
        break
      fi
    fi
    cmd="${proposed}"
    completed="${comp}"
  done

  if [ -z "${completed}" ] ; then
    COMPREPLY=( $( compgen -f -- "$cur" ) $( compgen -d -- "$cur" ) )
  else
    COMPREPLY=( $(compgen -W "${completed}" -- ${cur}) )
  fi
  return 0
}
complete -F _tempest tempest

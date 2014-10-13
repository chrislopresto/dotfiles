export PLYFE_USER=chris

alias syncdb='rake sync_database[false,"quick","production"] --trace'
alias syncdb-full='rake sync_database[true,"full","production"] --trace'
alias syncdb-keep-local='rake sync_database[true,"quick","production"] --trace'
alias syncdb-from-local-keep-local='rake sync_database[true,"local","production"] --trace'

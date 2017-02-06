alias rake='noglob bundle exec rake'
alias beg='bundle exec guard start'
alias rakeall='time bundle exec rake db:drop db:create db:migrate db:seed db:test:prepare'
alias rakeallt='time bundle exec rake db:drop --trace db:create --trace db:migrate --trace db:seed --trace db:test:prepare --trace'

function dbrr() {
  rake db:migrate:down VERSION=$1
  rake db:migrate:up VERSION=$1
}

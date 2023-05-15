export PYTHONPATH=${PROJDIR}/dj
export DATABASE_URL=postgres://fastn_cw:fastn_cw@127.0.0.1:5432/temp_db
export DIESEL_CONFIG_FILE=${PROJDIR}/diesel.toml


function pushd2() {
  PUSHED="$(pwd)"
  cd "$PROJDIR""$1" || return 0
}

function popd2() {
  cd "${PUSHED:-$PROJDIR}" || return 0
  unset PUSHED
}

function manage() {
  pushd2 /dj
  python3 manage.py $*
  r=$?
  popd2
  return ${r}
}

function makemigrations() {
  manage makemigrations $*
}

function migrate() {
  manage migrate $*
}

function djshell() {
  manage shell
}

function dbshell() {
  manage dbshell
}

function recreatedb() {
  DATABASE_NAME=temp_db
  ROLE_NAME=temp_user
  PASSWORD=temp_pass
  WHO=`whoami`
  psql -h 127.0.0.1 -U "${WHO}" -d postgres -c "DROP ROLE IF EXISTS ${ROLE_NAME};"
  psql -h 127.0.0.1 -U "${WHO}" -d postgres -c "CREATE ROLE ${ROLE_NAME} WITH SUPERUSER LOGIN PASSWORD '${PASSWORD}';"
  psql -h 127.0.0.1 -U "${WHO}" -d postgres -c "DROP DATABASE IF EXISTS ${DATABASE_NAME};"
  psql -h 127.0.0.1 -U "${WHO}" -d postgres -c "CREATE DATABASE ${DATABASE_NAME};"
  migrate $*
}

function pyfmt() {
  pushd2 /dj
  black .
  popd2
}


function install_diesel() {
  cargo install diesel_cli --no-default-features --features "postgres"
}

function diesel_schema() {
  (which diesel || install_diesel) >> /dev/null
  diesel print-schema only-tables --database-url=$DATABASE_URL > $PROJDIR/service/db/src/schema.rs
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' -e 's/Varchar/Text/g' $PROJDIR/service/db/src/schema.rs
  else
    sed -i -e 's/Varchar/Text/g' $PROJDIR/service/db/src/schema.rs
  fi
}

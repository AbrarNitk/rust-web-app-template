export PYTHONPATH=${PROJDIR}/dj

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

function pyfmt() {
  pushd2 /dj
  black .
  popd2
}


function install_diesel() {
  cargo install diesel_cli --no-default-features --features "postgres"
}

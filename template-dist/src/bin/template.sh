#!/usr/bin/env bash

HOME_DIR=$(
  cd "$(dirname $0)/.." || exit
  pwd
)
cd "${HOME_DIR}"
CONFIG_SCRIPT="${HOME_DIR}/bin/config.sh"
if [[ -f "${CONFIG_SCRIPT}" ]]; then
  source "${CONFIG_SCRIPT}"
fi

PID_DIR="${HOME_DIR}/pid"
if [[ ! -d "${PID_DIR}" ]]; then
  mkdir "${PID_DIR}"
fi
PID_FILE="${PID_DIR}/pid"
RUNNING=0
function is_running() {
  if [[ -f "${PID_FILE}" ]]; then
    kill -0 $(cat ${PID_FILE}) >/dev/null 2>&1
    if [[ "$?" == "0" ]]; then
      RUNNING=1
    fi
  fi
}

function start() {
  local JAVA_CMD="java"
  local CLASSPATH="${HOME_DIR}/libs/*:${HOME_DIR}/conf"
  local JAVA_OPT="-cp ${CLASSPATH} cn.sliew.TemplateApplication"
  is_running
  if [[ ${RUNNING} -eq 1 ]]; then
    echo "Process running!"
    exit -1
  fi
  if [[ -n "${JAVA_HOME}" ]]; then
    local JAVA_CMD="${JAVA_HOME}/bin/java"
  fi
  if [[ $1 == 0 ]]; then
    shift
    echo "Staring in backend"
    nohup $JAVA_CMD $JAVA_OPT $ENV_PARAMS $@ >/dev/null 2>&1 &
    local pid=$!
    echo "Running with pid ${pid}"
    echo "${pid}" >${PID_FILE}
  else
    shift
    echo "JAVA_OPTS=${JAVA_OPT}"
    echo "ARGUMENTS=$ENV_PARAMS $@"
    $JAVA_CMD $JAVA_OPT $ENV_PARAMS $@
  fi
}

function stop() {
  is_running
  if [[ ${RUNNING} -eq 1 ]]; then
    kill -9 $(cat ${PID_FILE})
    if [[ $? == 0 ]]; then
      echo "Stopped!"
      rm -rf "${PID_FILE}"
    else
      echo "Could not stop pid $(cat ${PID_FILE})"
    fi
  else
    echo "Process not running!"
  fi
}

function status() {
  is_running
  if [[ ${RUNNING} -eq 1 ]]; then
    echo "Process running with pid $(cat ${PID_FILE})"
  else
    echo "Process not running!"
  fi
}

function print_help() {
  echo "Usage:"
  echo "  $0 start|start-frontend|stop|status"
}

case $1 in
start)
  shift
  start 0 $@
  ;;
start-frontend)
  shift
  start 1 $@
  ;;
start-foreground)
  shift
  start 1 $@
  ;;
stop)
  shift
  stop
  ;;
status)
  shift
  status
  ;;
*)
  print_help
  ;;
esac

function fc-docker-compose() {
  docker-compose -f $FACTORIAL_PATH/docker-compose.local.yml --project-directory $FACTORIAL_PATH run --rm --label "traefik.enable=false" $*;
}

function fc-back-container() {
  docker ps | grep 'factorial_back-console_run' | awk -F ' ' '{print $NF}'
}

function fc-front-container() {
  docker ps | grep 'factorial_front_run' | awk -F ' ' '{print $NF}'
}

function fc-docker-exec() {
  CONTAINER=$(fc-back-container)

  if [ -n "$CONTAINER" ]; then
    docker exec -t -i $CONTAINER $*;
  else
    echo 'Container not found! Run the fc-docker-compose first!'
  fi
}

function fc-docker-exec-test-env() {
  CONTAINER=$(fc-back-container)

  ENV_TEST="${FACTORIAL_PATH}/.env.test.local"

  if [ -n "$CONTAINER" ]; then
    docker exec --env-file $ENV_TEST -t -i $CONTAINER $*;
  else
    echo 'Container not found! Run the fc-docker-compose first!'
  fi
}

function fc-docker-bash() {
  fc-docker-exec bash
}

function fc-docker-sorbet() {
  fc-docker-exec bundle exec srb $*;
}

function fc-docker-command() {
  CONTAINER=$(fc-back-container)

  if [ -n "$CONTAINER" ]; then
    docker exec -i $CONTAINER $*;
  else
    echo 'Container not found! Run the fc-docker-compose first!'
    exit 1
  fi
}

function fc-docker-run-pry() {
  docker-compose -f $FACTORIAL_PATH/docker-compose.local.yml --project-directory $FACTORIAL_PATH  run --rm --service-ports --name factorial_back_pry back
}

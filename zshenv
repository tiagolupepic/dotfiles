function fc-docker-compose() {
  docker-compose -f $FACTORIAL_PATH/docker-compose.yml --project-directory $FACTORIAL_PATH run --rm --label "traefik.enable=false" $*;
}

function fc-container() {
  docker ps | grep 'factorial_back_run' | awk -F ' ' '{print $NF}'
}

function fc-docker-exec() {
  CONTAINER=$(fc-container)

  if [ -n "$CONTAINER" ]; then
    docker exec -t -i $CONTAINER $*;
  else
    echo 'Container not found! Run the fc-docker-compose first!'
    exit 1
  fi
}

function fc-docker-bash() {
  fc-docker-exec bash
}

function fc-docker-sorbet() {
  fc-docker-exec bundle exec srb $*;
}

function fc-docker-command() {
  CONTAINER=$(fc-container)

  if [ -n "$CONTAINER" ]; then
    docker exec $CONTAINER $*;
  else
    echo 'Container not found! Run the fc-docker-compose first!'
    exit 1
  fi
}

function fc-docker-run-pry() {
  docker-compose -f $FACTORIAL_PATH/docker-compose.yml --project-directory $FACTORIAL_PATH  run --rm --service-ports --name factorial_back_pry back
}

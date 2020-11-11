# Docker Imagem Javase 8

### Download da imagem

docker pull marceloagmelo/minio:TAG_NAME

### Como usar a imagem

A imagem contém o script control.sh script, este script possui as seguintes opções.

#### Help

docker run --rm -ti marceloagmelo/minio:TAG_NAME help
```
========================================
USAGE: /control.sh COMMAND [args]
  Command list:
    - info      : execute info scripts
    - shell     : execute shell scripts
    - start     : execute start scripts
    - status    : execute status scripts
    - test      : execute test scripts
========================================
```

#### Start

O start por default executa o arquivo /application.jar
```
docker run -d -p 0.0.0.0:9000:9000 marceloagmelo/minio:TAG_NAME start
```

#### shell

```
docker run --rm -ti marceloagmelo/minio:TAG_NAME shell
```

```

## Time Zone
Por default a imagem usa o time zone "America/Sao_Paulo", Se você quiser alterar crie uma variável TZ.

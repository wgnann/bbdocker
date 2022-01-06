# bbdocker
Container que exibe um Firefox capaz de acessar o BB fortemente inspirado em https://github.com/farribeiro/wscef-docker.

### Como funciona?
1. Instalar o `docker` e o `docker-compose`;
2. Montar a imagem: `docker-compose build bb';
3. Rodar a imagem: `docker-compose run bb`.

### Caveats
Está configurado para usar o usuário com UID 1000, porém é necessário usar o mesmo UID do usuário com acesso ao X. Isso está no `Dockerfile`.

Se quiser compartilhar algum diretório com o containter (e.g. Downloads) é necessário configurar o `docker-compose.yml` para tanto.

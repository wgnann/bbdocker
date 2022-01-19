# bbdocker
Container que exibe um Firefox capaz de acessar o BB fortemente inspirado em https://github.com/farribeiro/wscef-docker.

### Como funciona?
1. Instalar o `docker` e o `docker-compose`;
2. Acessar o diretório depois de clonar;
3. Montar a imagem: `docker-compose build bb`;
4. Rodar o container: basta executar o `bancodobrasil.sh`.

### Caveats
O docker apaga a variável de ambiente `UID`, então precisamos definir uma outra, a `XUID`, para garantir a comunicação correta do X no container com o X no host.

Se quiser compartilhar algum diretório com o containter (e.g. Downloads) é necessário configurar o `docker-compose.yml` para tanto.

Para deploy da aplicação no docker, necessário criar um arquivo .env na raiz do projeto com as seguintes configurações:

    VIRTUAL_HOST= #HOST Usado pelo nginx para proxy
    VIRTUAL_PORT= #PORT usado pelo nginx para proxy
    KEY_STORE_PASSWORD= #senha do certificado
    KEY_STORE_NAME= #Nome do certificado


Alterar no arquivo docker-compose.yml o caminho da pasta que contém o certificado:

    volumes:
      - D:/Projetos/Docker/Projeto Arquitetura/certificados/.lucaslabs:/app/resources

# Eureka Server

Este projeto configura um **Eureka Server** que pode ser utilizado para registrar e gerenciar microsserviços. Ele está configurado para rodar em um container Docker com SSL habilitado, usando um certificado digital para garantir a comunicação segura.

## Pré-requisitos

1. **Docker e Docker Compose**:
   Certifique-se de ter o Docker e o Docker Compose instalados no seu sistema.
   
3. **Certificados SSL**:
   Por questões de segurança, os certificados SSL não são versionados neste repositório. Você precisará gerar ou obter o certificado e a chave privada antes de realizar o deploy.

## Passos para Configuração

### 1. Criando o Arquivo `.env`

Na raiz do projeto, crie um arquivo chamado `.env` com as seguintes configurações:

```ini
VIRTUAL_HOST=# Host usado pelo nginx para proxy
VIRTUAL_PORT=# Porta usada pelo nginx para proxy
KEY_STORE_PASSWORD=# Senha do certificado (keystore)
KEY_STORE_NAME=# Nome do arquivo do certificado (keystore)
```

### 2. **Configuração dos Certificados SSL**
Os certificados não são versionados por questões de segurança. Você precisará fornecer o certificado e a chave privada no formato keystore.p12.

- Estrutura de Pastas:
    * Crie uma pasta chamada certificados em algum diretório do seu computador. (Certifique-se de atualizar o arquivo docker-compose.yml com o diretório criado)
    * Dentro da pasta certificados, crie uma subpasta (Ex.:.lucaslabs) onde os arquivos do certificado e chave serão armazenados.
    * O caminho completo seria:
      ```ini
      caminho/da/pasta/certificados/.lucaslabs/keystore.p12
    * Gere os arquivos .`crt` e `.key` na pasta. (Para gerar os certificados, você pode utilizar o mkcert (https://github.com/FiloSottile/mkcert)
    * Gere também o arquivo `.p12` (O mkcert também faz isso)
 
### 3. **Configure o arquivo `hosts` do seu computador**
Caso queira acessar a aplicação com um DNS personalizado, crie uma nova entrada no arquivo `hosts`

Ex.:
```
127.0.0.1	eureka-server.lucaslabs.com
```

### 4. **Build e Deploy**
Execute o comando 
```
docker-compose up -d
```

### 5. **Acessando a aplicação**
Acesso a aplicação por meio do DNS configurado

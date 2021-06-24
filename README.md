# Preco Certo (API)

No Heroku [preco certo](https://preco-certo.herokuapp.com/)

Projeto para empresas/fábricas saberem o preco certo a serem vendido. 

## Documentação da API

Neste [link](https://app.getpostman.com/join-team?invite_code=2b25611260c4dcd87c9cce09f33361e2&ws=6e16437e-254b-41cd-865b-c565b2fff824) pode acessar a documentação no postman
Ou baixando o arquivo [doc/preco_certo.postman_collection.json](https://raw.githubusercontent.com/desenvolvendo-me/preco_certo/tree/release/v0.6/doc/preco_certo.postman_collection.json)
No Postman tem dois environments:
1. Development
    - HOST_URL = localhost:3000
2. Production
    - HOST_URL = https://preco-certo.herokuapp.com/

## Dependências

- Ruby 2.7.3
- Rails >= 6.1.3

Postgresql Com Docker
- Docker
- Docker Compose

Postgresql Sem Docker
- PostgreSQL 12

## Setup Com Docker

1. `git clone https://github.com/desenvolvendo-me/preco_certo.git`
2. `cd preco_certo`
3. `copy .env.example .env`
4. `docker-compose build`
5. `docker-compose up -d`
6. `rails db:create db:migrate db:seed`
7. `rails s`
8. Open your browser in [localhost:3000](http://localhost:3000)

## Github Actions

- Tem actions para o PR e push, verifica se os testes estão passando e se o rubocop encontra ofensas no código.
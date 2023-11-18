# Prova de Flutter
Prova de flutter apresentada pela [`Target Sistemas`](https://targetsistemas.com.br/) para a vaga de Desenvolvedor Flutter.

[🔗 Link da Prova](https://communication-assets.gupy.io/production/companies/519/emails/1699534614835/communication-assets-bea12160-7a4f-11ee-bc34-0fe607fe7114/prova_flutter.pdf)
## Índice

- [🛠️ Requisitos do Projeto](#%EF%B8%8F-requisitos-do-projeto)
    - [📱 Tela de Login](#-tela-de-login)
    - [📱 Tela de captura de Informação](#-tela-de-captura-de-informações)
- [🏁 Iniciar o Projeto](#-iniciar-o-projeto)
- [🧑🏻‍💻 O Desenvolvimento](#-o-desenvolvimento)
    - [🌐 Conexão com o Firebase](#-conexão-com-o-firebase)
    - [📱 Tela de Login](#-tela-de-login-1)
    - [📱 Tela de captura de Informação](#-tela-de-captura-de-informações-1)
- [📽️ Vídeo de Demonstração](#%EF%B8%8F-vídeo-de-demonstração)

---
## 🛠️ Requisitos do projeto
Abaixo os requisitos propostos pela organização para as telas a serem desenvolvidas na avaliação.

### 📱 Tela de Login

#### Essa tela deve contar:

- [x] Campo de Senha;

- [x] Um campo de texto para representar o Login;

- [x] Um Label descrito "Política de privacidade".

#### O comportamento da tela:
- Verificar e alertar se ambos os campos de Login e senha estão preenchidos.
    - O campo senha não pode ter menos que dois caracteres.
    - O campo senha não pode ter caracteres especiais, sendo apenas possível informar 'a' até 'Z' e '0' até '9'.

- Ambos os campos não podem ultrapassar 20 caracteres.
- Ambos os campos não podem terminar com o caractere de espaço no final.
- Se ambas as informações estiverem preenchidas deve ir para a próxima tela.
- Ao tocar no label "Política de privacidade" uma página web direcionada para o `google.com.br` deve ser aberta. 

#### Exemplo dado:

![Exemplo tela de Login](https://github.com/matheusrmatias/provaflutter-Target-Sistemas/assets/115509118/ce7fc357-5fde-4fd6-ac4f-02d4e16c175d)

### 📱 Tela de Captura de Informações
#### Essa tela deve conter:

- [x] Um card principal e central;

- [x] Um campo de texto 

#### O comportamento da tela:
- O foco da digitação deve estar o tempo todo no campo de "Digite seu texto" e não pode ser perdido ao interagir com a tela.
- Ao acionar o "enter" o campo tem que verificar se a informação foi preenchida.
- O Card principal deve receber a informação digitada do campo.
- As informações precisam ser salvas e lidas uƟlizando a biblioteca shared_preferences
- O Icone de excluir deve abrir um pop-up confirmando a ação.
- Obrigatório a utilização do plugin MOBX para a construção da tela. 

#### Exemplo dado:

![Exemplo tela de Captura de Informações](https://github.com/matheusrmatias/provaflutter-Target-Sistemas/assets/115509118/737daae2-7888-4017-a7f3-25227b2f910f)

---
## 🏁 Iniciar o Projeto
Para iniciar o proejeto é necessário conecta-lo à um projeto do Firebase, sendo assim, execute os seguintes comandos.

### Clonando o Projeto
Utilize o seguinte comando para fazer o clone deste repositório.

```bash
git clone https://github.com/matheusrmatias/provaflutter-Target-Sistemas.git
```

### Obtendo as dependêcias
É necessário obter as dependências do projeto, sendo assim, com um terminal aberto no diretório do projeto execute o seguinte comando.
```bash
flutter pub get
```

### Conectando ao Firebase
Siga o passo a passo da documentação oficial do Firebase "[`Adicionar o Firebase ao seu app Flutter`](https://firebase.google.com/docs/flutter/setup?hl=pt-br&platform=android)".

### Habilitar Autenticação
No console do Firebase, vá até "Authentication" e habilite o login por email e senha. Após isso adicione um usuário para teste.
[📽️ Link do Vídeo](https://github.com/matheusrmatias/provaflutter-Target-Sistemas/assets/115509118/9fdde0b7-1c70-4336-b4ef-90ea2181e5b5
)

---
## 🧑🏻‍💻 O Desenvolvimento
Abaixo o que foi desenvolvido no projeto, com as telas e funcionamento e detalhes do código.

### 🌐 Conexão com o Firebase
Embora uma conexão com uma API não fosse obrigatória, optei por conectar ao [`Firebase Auth`]() para autenticação de usuários. Adiante os usuários disponíveis no projeto do Firebase conectado ao release disponibilizado.

#### User 1

>E-mail
>```
> user@example.com
>```
>Senha
>```
> 123456
>```

#### User 2

>E-mail
>```
> user2@example.com
>```
>Senha
>```
> 123456
>```

### 📱 Tela de Login

| Tela | Validação 1 | Validação 2 |
| --- | --- | --- |
| ![Tela de Login](https://github.com/matheusrmatias/provaflutter-Target-Sistemas/assets/115509118/1cb80ede-bf48-43dd-adfb-917b8a813c8b) | ![Validação 1](https://github.com/matheusrmatias/provaflutter-Target-Sistemas/assets/115509118/16cb9143-65af-4ad5-bbd6-4293030d9ddd) | ![Validação 2](https://github.com/matheusrmatias/provaflutter-Target-Sistemas/assets/115509118/8c245717-d53c-4fc5-acd5-20f4adf70050) |

| [Código de Validação de Usuário](https://github.com/matheusrmatias/provaflutter-Target-Sistemas/blob/main/lib/src/screens/login_page.dart) | [Código de Validação de Senha](https://github.com/matheusrmatias/provaflutter-Target-Sistemas/blob/main/lib/src/screens/login_page.dart) |
| --- | --- |
| ![Validaçõa Usuário](https://github.com/matheusrmatias/provaflutter-Target-Sistemas/assets/115509118/e4575b7b-a9aa-4c4b-86d7-4ade8a3e360a) | ![Validação Senha](https://github.com/matheusrmatias/provaflutter-Target-Sistemas/assets/115509118/dc3e3527-9686-44e6-b9f1-eeef9f2fb29a) |

### 📱 Tela de Captura de Informações

| Tela |  |  |
| --- | --- | --- |
| ![Tela de Captura de Informações](https://github.com/matheusrmatias/provaflutter-Target-Sistemas/assets/115509118/0d3e5154-550b-473a-90c0-5036ec78257f) | ![Tela de Captura de Informações 2](https://github.com/matheusrmatias/provaflutter-Target-Sistemas/assets/115509118/4964dd72-f974-49c2-ac3e-904d58a25e1b) | ![Tela de Captura de Informações 3](https://github.com/matheusrmatias/provaflutter-Target-Sistemas/assets/115509118/c8041885-c4e0-4296-b968-2b5f6113da6d) |
| ![Tela de Captura de Informações 4](https://github.com/matheusrmatias/provaflutter-Target-Sistemas/assets/115509118/5f160f92-36c2-40e3-bfa9-50544ec5fbd2) |  |  |

---

## 📽️ Vídeo de Demonstração
[🔗 Link do Vídeo](https://github.com/matheusrmatias/provaflutter-Target-Sistemas/assets/115509118/ceb7720c-970c-49c4-bf86-91f9228d096c)

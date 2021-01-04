# VALIDAÇÃO DE SENHA ![ICONE iOS](https://imgur.com/zv9U9vM.png) ![ICONE ANDROID](https://imgur.com/3NxAWtP.png)

##### Tecnologias Utilizadas:

<p>
    <img src="https://img.shields.io/badge/Flutter%20-%2302569B.svg?&style=for-the-badge&logo=Flutter&logoColor=white"/>
    <img src="https://img.shields.io/badge/dart-%230175C2.svg?&style=for-the-badge&logo=dart&logoColor=white"/>
</p>



##### Configuração de Ambiente:

Caso precise de ajuda em configurar o ambiente para executar o projeto Flutter <a href = "https://medium.com/@rdias.ga?source=post_page-----7d19cfdae1b8--------------------------------"><img src="https://img.shields.io/badge/CLICK AQUI-%23{#00AFAA}.svg?&style=for-the-badge&logo={ICON}&logoColor=white"></a>, que tera acesso a um artigo feito por <i>Rafael Dias</i> , publicado no site https://medium.com/ dia 25 de Março de 2019.



##### Descrição do Projeto:

Neste projeto foi criado um aplicativo mobile híbrido que efetua o cadastro de um usuario com os seguintes critérios para validação da senha:
- Nove ou mais caracteres
- Ao menos 1 dígito
- Ao menos 1 letra minúscula
- Ao menos 1 letra maiúscula
- Ao menos 1 caractere especial
- Considere como especial os seguintes caracteres: !@#$%^&*()-+
- Não possuir caracteres repetidos dentro do conjunto

- Espaços em branco não devem ser considerados como caracteres válidos

Para atender a esses requisitos de validação foi criado dentro da pasta <b>components\editor.dart</b> uma classe chamada <b>EditorSenha</b> que contém o campo <b>validator</b> que recebe um método <b>validarSenha</b> que possui todo o código elaborado para fazer a validação da senha.

No método <b>validarSenha</b> a primeira validação pega senha digitada é converte em uma lista, após isso por meio de um <b>for</b> essa lista é percorrida com o fim de localizar algum digito duplicado, em seguida temos a utilização de <b>ifs</b> juntamente com <b>RegExp (Regular Expression)</b> que verificam as demais validações.



##### Pré-visualização do Projeto:

<img src="/preview-project/preview-project.gif" width="500" height="1000" />
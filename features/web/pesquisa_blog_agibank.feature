Feature: Pesquisa no blog do Agibank
  Como um usuário do blog
  Quero utilizar a funcionalidade de pesquisa
  Para encontrar conteúdos relevantes

  Scenario: Pesquisar por um termo válido
    Given que acesso o blog do Agibank
    When clico no botão de pesquisa
    And informo o termo "empréstimo"
    Then devo visualizar resultados relacionados ao termo pesquisado

  Scenario: Pesquisar sem informar termo
    Given que acesso o blog do Agibank
    When clico no botão de pesquisa
    And não informo nenhum termo
    Then devo visualizar uma mensagem ou comportamento padrão de pesquisa

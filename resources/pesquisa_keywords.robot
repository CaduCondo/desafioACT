*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                https://blogdoagi.com.br/
${BROWSER}            chrome
${LUPA_PESQUISA}      id=search-open
${CAMPO_INPUT}        css:.ast-search-menu-icon.slide-search input.search-field
${BOTAO_FECHAR}       id=search-close
${RODAPE}             id=colophon

*** Keywords ***
Abrir navegador
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # Se a variável BROWSER for 'headlesschrome', adicionamos os argumentos necessários
    Run Keyword If    '${BROWSER}' == 'headlesschrome'    Call Method    ${options}    add_argument    --headless
    Run Keyword If    '${BROWSER}' == 'headlesschrome'    Call Method    ${options}    add_argument    --no-sandbox
    Run Keyword If    '${BROWSER}' == 'headlesschrome'    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    
    Open Browser    ${URL}    ${BROWSER}    options=${options}
    Maximize Browser Window
    Set Selenium Timeout    20s

Finalizar teste
    # Conforme solicitado, captura screenshot sempre
    Capture Page Screenshot
    Close Browser

Dado que acesso o blog do Agibank
    Go To    ${URL}
    # Garante que o rodapé carregou (estratégia que definimos)
    Wait Until Element Is Visible    ${RODAPE}    timeout=30s

Quando abro a pesquisa
    Wait Until Element Is Visible    ${LUPA_PESQUISA}
    Click Element    ${LUPA_PESQUISA}
    # PAUSA PARA ANIMAÇÃO: O campo leva alguns milissegundos para deslizar
    Sleep    2s 
    # Usamos um seletor mais específico para o campo de input
    Wait Until Element Is Visible    ${CAMPO_INPUT}    timeout=10s

E pesquiso por "${termo}"
    # Limpa e digita o termo
    Input Text      ${CAMPO_INPUT}    ${termo}
    Press Keys      ${CAMPO_INPUT}    ENTER

E clico para fechar a pesquisa
    Wait Until Element Is Visible    ${BOTAO_FECHAR}
    Click Element    ${BOTAO_FECHAR}

Então o campo de pesquisa deve desaparecer da tela
    Wait Until Element Is Not Visible    ${CAMPO_INPUT}

Então devo visualizar a página de resultados de busca
    Wait Until Page Contains    Resultados encontrados para:

Então devo visualizar a mensagem de resultados não encontrados
    Wait Until Page Contains    Lamentamos, mas nada coincide
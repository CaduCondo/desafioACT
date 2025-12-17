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
    # Configurações para estabilidade no CI (Headless)
    Run Keyword If    '${BROWSER}' == 'headlesschrome'    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --window-size\=1920,1080
    
    Open Browser    ${URL}    ${BROWSER}    options=${options}
    Set Selenium Timeout    20s

Finalizar teste
    # Tira print sempre, conforme solicitado (sucesso ou falha)
    Capture Page Screenshot
    Close Browser

Dado que acesso o blog do Agibank
    Go To    ${URL}
    Wait Until Element Is Visible    ${RODAPE}    timeout=30s

Quando abro a pesquisa
    Wait Until Page Contains Element    ${LUPA_PESQUISA}    timeout=30s
    # Clique via JS para evitar erro de "Element not visible" no ambiente de CI
    Execute Javascript    document.getElementById('search-open').click()
    # Pequena pausa para a animação de abertura do campo
    Sleep    1s
    Wait Until Element Is Visible    ${CAMPO_INPUT}    timeout=15s

E pesquiso por "${termo}"
    Input Text      ${CAMPO_INPUT}    ${termo}
    Press Keys      ${CAMPO_INPUT}    ENTER

E clico para fechar a pesquisa
    Wait Until Element Is Visible    ${BOTAO_FECHAR}
    Click Element    ${BOTAO_FECHAR}

Então o campo de pesquisa deve desaparecer da tela
    Wait Until Element Is Not Visible    ${CAMPO_INPUT}

Então devo visualizar a página de resultados de busca
    Wait Until Page Contains    Resultados encontrados para:    timeout=20s

Então devo visualizar a mensagem de resultados não encontrados
    Wait Until Page Contains    Lamentamos, mas nada coincide    timeout=20s
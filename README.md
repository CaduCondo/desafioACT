# Robot Framework BDD project — nopCommerce demo

**Generated:** 2025-09-30 04:32:15 UTC

Este projeto contém um scaffold em Robot Framework com estilo BDD/Gherkin (feature files para leitura)
e suites Robot executáveis. Também inclui um workflow do GitHub Actions para rodar os testes.

## Estrutura do projeto
```
nopcommerce_robot_project/
├── .github/
│   └── workflows/robot.yml
├── features/
│   └── nopcommerce.feature
├── tests/
│   └── test_nopcommerce.robot
├── resources/
│   └── Keywords.robot
├── results/
├── requirements.txt
└── README.md
```

## Instalação local
Recomendado criar um virtualenv Python 3.8+:
```bash
python -m venv .venv
source .venv/bin/activate   # mac/linux
.venv\Scripts\activate    # windows
pip install -r requirements.txt
```

## Executando os testes
Os testes Robot estão em `tests/test_nopcommerce.robot`. Para rodar:
```bash
robot -d results tests
ou
Use para rodar via gradle:
'.\gradlew.bat robotTests'
```
Observações:
* Use `--variable BROWSER:chrome` para rodar com Chrome. Você pode usar firefox também se tiver o driver.
* O projeto usa **webdriver-manager** para ajudar a baixar drivers automaticamente quando necessário.
* Existe um arquivo `features/nopcommerce.feature` com a descrição BDD/Gherkin para leitura. 
  Caso queira executar `.feature` diretamente, instale `robotframework-gherkin` (já listado em requirements) e siga a documentação do pacote.

## GitHub Actions
O workflow `.github/workflows/robot.yml` instala dependências e executa `robot` na runner.
Ele salva artefatos `results` (logs, report, output.xml).

## O que os testes fazem
Contém cenários (implementação simplificada — pode precisar de ajustes de *locators* dependendo da versão do site):
- Adicionar produto no carrinho
- Tirar produto do carrinho
- Adicionar 2 produtos no carrinho
- Criar usuário
- Fazer login com o usuário criado
- Finalizar compra com 1 produto (fluxo simplificado)
- Finalizar compra com 2 produtos (fluxo simplificado)

> 🚨 *Importante:* O site demo (`https://demo.nopcommerce.com/`) pode mudar a estrutura HTML/IDs com o tempo.
As keywords foram escritas de forma robusta, porém você pode precisar ajustar seletores em `resources/Keywords.robot`.

## Como abrir Report/Log
Após a execução local, abra `results/report.html` e `results/log.html`.

## Pacote
Um arquivo `.zip` com todo o projeto está disponibilizado ao lado para download.

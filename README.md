# 🔍 Automação de Testes - Blog Agibank

Este projeto contém a automação de testes para a funcionalidade de pesquisa do **Blog do Agibank**. O objetivo é validar a busca por termos válidos, inexistentes, caracteres especiais e o comportamento de fechamento do campo de busca.

A solução foi desenvolvida utilizando **Robot Framework** e **SeleniumLibrary**, estruturada com o padrão de **Keywords** para facilitar a manutenção, legibilidade e reuso de código.

---

## 🚀 Tecnologias Utilizadas

* **Linguagem:** Python 3.10+
* **Framework:** Robot Framework
* **Biblioteca de UI:** SeleniumLibrary
* **CI/CD:** GitHub Actions
* **Relatórios:** Robot Framework Logs (HTML) e GitHub Job Summary

---

## 🛠️ Configuração do Ambiente

O projeto é **multiplataforma**, sendo compatível com **Windows, Linux e macOS**.

### 1. Pré-requisitos
* [Python 3.10+](https://www.python.org/downloads/) instalado e configurado no PATH.
* Navegador **Google Chrome** instalado.

### 2. Instalação
Clone o repositório e instale as dependências necessárias utilizando o arquivo de requisitos:

```bash
# Clonar o repositório
git clone [https://github.com/SEU_USUARIO/desafioACT.git](https://github.com/SEU_USUARIO/desafioACT.git)
cd desafioACT

# Instalar dependências
pip install -r requirements.txt
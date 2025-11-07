# ☁️ oci-terraform

Infraestrutura de exemplo na **Oracle Cloud Infrastructure (OCI)** utilizando **Terraform**.  
Este repositório foi criado para fins de **estudo, documentação e demonstração de boas práticas** em IaC (Infrastructure as Code).  

O projeto simula um ambiente básico composto por três instâncias — **bastion**, **aplicação (GLPI)** e **banco de dados** — com foco em:
- Automação de provisionamento na OCI;
- Organização de código em módulos e variáveis;
- Uso seguro de variáveis e arquivos `.tfvars`;

Todos os valores contidos neste repositório (OCIDs, IPs, subnets, chaves e regiões) são **fictícios**, servindo apenas como modelo de referência.

---

## 🧱 Estrutura do projeto

📦 oci-terraform/
├── 🧩 main.tf → Recursos principais (instâncias OCI)
├── ⚙️ variables.tf → Declaração de variáveis
├── 📤 outputs.tf → Saídas (IPs e metadados)
├── 🧾 terraform.tfvars.example → Exemplo de variáveis locais
├── 🚫 .gitignore → Arquivos ignorados por segurança
└── 🤖 .github/workflows/
└── terraform-ci.yml → CI (fmt / validate)

## ⚙️ Pré-requisitos

- [Terraform](https://developer.hashicorp.com/terraform/downloads) `>= 1.5.0`
- Conta na [Oracle Cloud Infrastructure (OCI)](https://cloud.oracle.com/)
- Chave de API configurada localmente:
  - `~/.oci/config`
  - `~/.oci/oci_api_key.pem`

---

## 🚀 Como usar

1. Clone o repositório:
   ```bash
   git clone https://github.com/felipedias/oci-terraform.git
   cd oci-terraform

2. Copie o arquivo de variáveis de exemplo:
  cp terraform.tfvars.example terraform.tfvars

3. Edite o arquivo terraform.tfvars com seus valores reais:

4. Execute o Terraform:
   terraform init
   terraform plan
   terraform apply

🔒 Segurança

Nenhum dado sensível é versionado neste repositório.
Os arquivos .tfstate, .tfvars, .pem, .key e .env estão protegidos via .gitignore.
As variáveis e chaves presentes são apenas exemplos (placeholders).
O projeto utiliza apenas recursos gratuitos (Always Free) da OCI.


# hotel-database
Banco de dados para sistema de hotel - MySQL

🏨 Hotel Database:

Tornei este projeto baseado em um trabalho acadêmico. Fiz primeiramente o MER (Modelo-Entidade-Relacionamento), converti para o modelo lógico com algumas alterações e transformei para o modelo lógico.
O modelo de banco de dados é de um sistema de gestão hoteleira, desenvolvido em **MySQL**.  
O objetivo é permitir o controle de reservas, hóspedes, quartos, funcionários e pagamentos de forma organizada e eficiente.

---

📘 Descrição

O banco de dados foi modelado seguindo boas práticas de normalização e integridade referencial.  
Foram criadas as seguintes entidades principais:

- **Hotel**: informações básicas do hotel.  
- **Endereço**: tabela auxiliar para armazenar endereços.  
- **Funcionário**: dados dos colaboradores do hotel.  
- **Hóspede**: dados dos clientes.  
- **Quarto**: informações sobre os quartos disponíveis.  
- **Reserva**: controle de reservas feitas pelos hóspedes.  
- **Pagamento**: controle das formas e status de pagamento.  
- **ReservaQuarto**: relação entre reservas e quartos (N:N).

---

🧩 Banco

- **SGBD:** MySQL  
- **Normalização:** até 3FN  
- **Relacionamentos:** 1:N e N:N  
- **Integridade referencial:** garantida com chaves estrangeiras (FKs) e cascatas de atualização.  

## 🎯 Objetivo do Projeto

O objetivo principal é fornecer um **sistema de gestão hoteleira** robusto, eficiente e bem organizado.

O banco de dados foi modelado para permitir o controle centralizado de:
* ✅ **Reservas** (Check-in, Check-out, Status)
* ✅ **Hóspedes** e **Funcionários**
* ✅ **Quartos** (Tipos, Preços, Disponibilidade)
* ✅ **Pagamentos** (Formas e Status)

---

## ⚙️ Tecnologias e Modelagem

| Recurso | Detalhe |
| :--- | :--- |
| **SGBD** | MySQL |
| **Normalização** | 3ª Forma Normal (3FN) |
| **Modelagem** | Modelo Entidade-Relacionamento (MER) convertido para Lógico/Relacional. |
| **Integridade** | Garantida por Chaves Estrangeiras (`FOREIGN KEY`) com ações de cascata (`ON UPDATE CASCADE`). |

## 🧩 Estrutura do Banco de Dados

A arquitetura do banco de dados é composta por **8 tabelas principais**, desenhadas para evitar redundância e garantir a integridade referencial.

### Entidades Principais

| Tabela | Descrição | Relacionamentos |
| :--- | :--- | :--- |
| `Endereco` | Endereços genéricos para reuso (Hóspede, Funcionário, Hotel). | 1:N com Hotel, Funcionario, Hospede |
| `Hotel` | Informações do hotel. | 1:N com Funcionario, Quarto |
| `Funcionario` | Dados dos colaboradores (inclui credenciais de Login/Senha). | 1:N com Reserva |
| `Hospede` | Dados dos clientes. | 1:N com Reserva |
| `Quarto` | Detalhes do quarto (Tipo, Preço Diária, Status). | N:N com Reserva (via `ReservaQuarto`) |
| `Pagamento` | Registro de formas, datas e valores de pagamento. | 1:N com Reserva |
| `Reserva` | Registro da transação (datas, hóspede, funcionário, pagamento). | N:N com Quarto (via `ReservaQuarto`) |
| `ReservaQuarto` | Tabela associativa que relaciona uma Reserva a múltiplos Quartos. | N:N entre Reserva e Quarto |

### 🖼️ Diagrama Relacional (Sugestão de Visual)

[REDE DE HOTEL.pdf](https://github.com/user-attachments/files/23097027/REDE.DE.HOTEL.pdf)

### ↪️ Modelol lógico (Ferramenta: DB Designer)

<img width="673" height="437" alt="Modelo logico_Hotel" src="https://github.com/user-attachments/assets/61313705-5d8c-4cbd-af5e-1ebe6624ac16" />

## ⚙️ Como usar

1. Crie o banco de dados:
   ```sql
   CREATE DATABASE HotelDB;
   USE HotelDB;
   ```
2. Execute o script SQL completo em: 
   

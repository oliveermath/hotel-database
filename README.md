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

🧩 Estrutura do Banco

- **SGBD:** MySQL  
- **Normalização:** até 3FN  
- **Relacionamentos:** 1:N e N:N  
- **Integridade referencial:** garantida com chaves estrangeiras (FKs) e cascatas de atualização.  

---

## ⚙️ Como usar

1. Crie o banco de dados:
   ```sql
   CREATE DATABASE HotelDB;
   USE HotelDB;

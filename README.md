# SQL Learning Journey 🗄️

A structured, beginner-to-advanced series of MySQL exercises built on a fictional **Parks and Recreation** employee database. Each file isolates one concept, progresses logically from the last, and is written with clear comments designed for revision and reference.

---

Repository Structure

```
SQL-Learning-Journey/
│
├── README.md
│
├── database/
│   └── 01_create_database.sql      # Schema + seed data for all exercises
│
└── queries/
    ├── 02_select_statements.sql
    ├── 03_where_clause.sql
    ├── 04_group_by_order_by.sql
    ├── 05_having_limit_aliasing.sql
    ├── 06_joins.sql
    ├── 07_unions.sql
    ├── 08_string_functions.sql
    ├── 09_case_statements.sql
    ├── 10_subqueries.sql
    ├── 11_window_functions.sql
    ├── 12_ctes.sql
    ├── 13_temporary_tables.sql
    ├── 14_stored_procedures.sql
    └── 15_triggers_and_events.sql
```

---

## 🗃️ Database Overview

All queries run against the `Parks_and_Recreation` database, which contains three tables:

| Table | Description |
|---|---|
| `employee_demographics` | Personal details — name, age, gender, birth date |
| `employee_salary` | Job title, salary, and department assignment |
| `parks_departments` | Department IDs and names |

Run `database/01_create_database.sql` first to create and seed the database before executing any query file.

---

## 📋 Topics Covered

| # | File | Concepts |
|---|---|---|
| 01 | `01_create_database.sql` | DDL, CREATE TABLE, INSERT INTO |
| 02 | `02_select_statements.sql` | SELECT, arithmetic expressions, DISTINCT |
| 03 | `03_where_clause.sql` | Comparison operators, AND / OR / NOT, LIKE |
| 04 | `04_group_by_order_by.sql` | GROUP BY, aggregate functions, ORDER BY |
| 05 | `05_having_limit_aliasing.sql` | HAVING vs WHERE, LIMIT, column aliasing |
| 06 | `06_joins.sql` | INNER JOIN, LEFT/RIGHT OUTER JOIN, Self Join, multi-table joins |
| 07 | `07_unions.sql` | UNION DISTINCT, UNION ALL, label columns |
| 08 | `08_string_functions.sql` | LENGTH, UPPER/LOWER, TRIM, SUBSTRING, REPLACE, LOCATE, CONCAT |
| 09 | `09_case_statements.sql` | CASE / WHEN / THEN / END, multi-column CASE logic |
| 10 | `10_subqueries.sql` | Subqueries in WHERE, SELECT, and FROM clauses |
| 11 | `11_window_functions.sql` | OVER(), PARTITION BY, rolling totals, ROW_NUMBER, RANK, DENSE_RANK |
| 12 | `12_ctes.sql` | WITH clause, multiple CTEs, column aliasing in CTE definition |
| 13 | `13_temporary_tables.sql` | CREATE TEMPORARY TABLE, populating from SELECT |
| 14 | `14_stored_procedures.sql` | CREATE PROCEDURE, DELIMITER, BEGIN...END, parameters |
| 15 | `15_triggers_and_events.sql` | AFTER INSERT trigger, scheduled EVENTs |

---

## 🚀 Getting Started

### Prerequisites
- [MySQL](https://dev.mysql.com/downloads/) 8.0+ or [MySQL Workbench](https://www.mysql.com/products/workbench/)

### Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/SQL-Learning-Journey.git
   ```

2. Open MySQL Workbench (or your preferred client) and run the database setup script first:
   ```sql
   SOURCE database/01_create_database.sql;
   ```

3. Open any query file from the `queries/` folder and run it against the `Parks_and_Recreation` database.

---

## 💡 Key Concepts at a Glance

**Window Functions vs GROUP BY**
> GROUP BY collapses multiple rows into one row per group. Window functions (using `OVER()`) keep every individual row while still allowing group-level calculations alongside them.

**CTEs vs Subqueries**
> Both produce a temporary result set. CTEs (defined with `WITH`) are written once at the top and referenced by name, making complex queries easier to read and maintain. Subqueries are embedded inline and can only be used in that one spot.

**HAVING vs WHERE**
> `WHERE` filters raw rows before any grouping occurs. `HAVING` filters after aggregation and is the only way to filter on the result of an aggregate function such as `AVG()` or `COUNT()`.

---

## 🛠️ Tools Used

- **MySQL 8.0**
- **MySQL Workbench**

---

## 📖 Learning Resource

This project follows the [Alex the Analyst](https://www.youtube.com/@AlexTheAnalyst) SQL Beginner to Advanced tutorial series on YouTube.

---

## 📄 License

This repository is for educational purposes. The Parks and Recreation character names are the property of their respective owners and are used here solely as sample data.

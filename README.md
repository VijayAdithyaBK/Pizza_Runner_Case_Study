# 🍕 Pizza Runner Case Study

[![SQL](https://img.shields.io/badge/SQL-PostgreSQL-blue.svg)](https://www.postgresql.org/)
[![Status](https://img.shields.io/badge/Status-Completed-success.svg)]()

**Pizza Runner** is a data-driven case study that explores the intersection of 80s retro aesthetics and modern delivery operations. Founded by Danny, a data scientist with a passion for pizza, this project focuses on cleaning, analyzing, and optimizing a complex pizza delivery database to drive business growth.

## 🚀 Key Features

- **Data Cleaning & Transformation**: Standardizing inconsistent data formats for distances, durations, and null values.
- **Pizza Metrics Analysis**: Evaluating order volumes, unique customer behaviors, and delivery success rates.
- **Runner & Customer Experience**: Calculating average speeds, delivery times, and runner performance.
- **Ingredient Optimization**: Analyzing topping popularity and generating descriptive ingredient lists.
- **Pricing & Revenue Modeling**: Calculating profits, revenue impact of extras, and designing a rating system.

## 🛠 Tech Stack

- **Database**: [PostgreSQL 13+](https://www.postgresql.org/)
- **Dialect**: PL/pgSQL
- **Tools**: SQL Scripts, ER Diagramming

## 📂 Project Structure

```
├── README.md               # Project documentation
├── Project_Details.md      # Full case study description & requirements
├── assets/                 # Project images and ER diagrams
│   └── pizza_runner_erd.png
└── code/                   # SQL source code
    ├── schema.sql          # Database schema and data insertion
    └── analysis.sql        # Solutions to all case study questions
```

## 📊 Database Schema (ERD)

The project utilizes a relational schema consisting of 6 tables:

- `runners`: Runner registration details.
- `customer_orders`: Individual pizza orders with exclusions and extras.
- `runner_orders`: Delivery metrics including distance and duration.
- `pizza_names`: Menu of available pizzas.
- `pizza_recipes`: Standard ingredients for each pizza.
- `pizza_toppings`: Reference table for all possible ingredients.

## 🛠 Prerequisites

- A PostgreSQL instance (Local installation, [Supabase](https://supabase.com/), or [Neon](https://neon.tech/)).
- A SQL client like [DBeaver](https://dbeaver.io/), [pgAdmin](https://www.pgadmin.org/), or the `psql` CLI.

## 🏁 Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/VijayAdithyaBK/Pizza_Runner_Case_Study.git
cd Pizza_Runner_Case_Study
```

### 2. Database Setup
Execute the schema script to create the `pizza_runner` schema and populate the initial data:
```bash
psql -U your_username -d your_database -f code/schema.sql
```

### 3. Run Analysis
Execute the analysis script to generate insights for all focus areas:
```bash
psql -U your_username -d your_database -f code/analysis.sql
```

## 🧹 Data Cleaning Highlights

Before deep-diving into analysis, several data quality issues were addressed in the `customer_orders` and `runner_orders` tables:

- **Handling Nulls**: Standardized `null`, `'null'`, and empty strings into actual `NULL` values.
- **Inconsistent Units**: Stripped `'km'`, `'mins'`, and `'minutes'` from numeric columns.
- **Type Casting**: Converted `pickup_time` to `TIMESTAMP`, `distance` to `FLOAT`, and `duration` to `INTEGER`.

## 📝 Case Study Questions

The analysis is structured into five distinct sections:

| Section | Focus Area | Key Metric Example |
| :--- | :--- | :--- |
| **A** | **Pizza Metrics** | Total pizzas ordered, unique customer orders, hourly volume. |
| **B** | **Runner & Customer** | Average speed per runner, distance traveled per customer. |
| **C** | **Ingredient Opt.** | Most common extras/exclusions, custom ingredient lists. |
| **D** | **Pricing & Ratings** | Total revenue, runner fees, profit calculations. |
| **E** | **Bonus Challenges** | Designing schema for new pizzas and dynamic ratings. |

## 🏆 Acknowledgments

This project is part of the **#8WeekSQLChallenge** by [Danny Ma](https://www.datawithdanny.com/).

---

<p align="center">
  <i>Developed with 🍕 and ☕ by <b>Vijay Adithya B K</b></i>
</p>
<p align="center">
  <a href="https://github.com/VijayAdithyaBK">
    <img src="https://img.shields.io/badge/GitHub-Profile-black?style=flat&logo=github" alt="GitHub">
  </a>
</p>

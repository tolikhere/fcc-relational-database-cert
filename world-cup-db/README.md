# 🏆 World Cup Database

This project is part of the [FreeCodeCamp Relational Database Certification](https://www.freecodecamp.org/learn/relational-databases-v9/). It involves creating a **Bash script** to parse data from a **CSV file** and insert it into a **PostgreSQL database**, then querying that database for specific tournament statistics.


## 🚀 Project Overview

The goal of this project was to automate the process of populating a relational database with historical World Cup data (from 2014 and 2018) and performing data analysis using SQL.


### Features
*   **Automated Data Insertion**: A Bash script (`insert_data.sh`) that reads `games.csv`, handles unique team entries, and maps foreign keys.
*   **Relational Schema**: A normalized database design with `teams` and `games` tables.
*   **Data Analysis**: A query script (`queries.sh`) that calculates totals, averages, and specific tournament statistics using SQL.


## ⚡ Key Skills Demonstrated

- **Database Schema Design**: Creating tables with proper data types, primary keys, and foreign key constraints.
- **Bash Scripting**: Writing scripts to read CSV files and execute SQL commands.
- **Data Normalization**: Ensuring data integrity by properly linking teams and games.
- **Advanced SQL Queries**: Using `JOIN`, `SUM`, `AVG`, `GREATEST`, `MAX`, `COUNT`, `ROUND`, `DISTINCT`, and `LIKE` to extract specific information.


## 🏛 Database Schema
The worldcup database consists of two tables:

### `teams` Table

| Column | Type | Description |
| :--- | :--- | :--- |
| `team_id` | SERIAL | Primary Key |
| `name` | VARCHAR | Unique name of the team |

### `games` Table

| Column | Type | Description |
| :--- | :--- | :--- |
| `game_id` | SERIAL | Primary Key |
| `year` | INT | Year of the tournament |
| `round` | VARCHAR | Tournament round (e.g., Final, Semi-final) |
| `winner_id` | INT | Foreign Key referencing `teams(team_id)` |
| `opponent_id` | INT | Foreign Key referencing `teams(team_id)` |
| `winner_goals` | INT | Goals scored by the winning team |
| `opponent_goals` | INT | Goals scored by the opponent team |

All columns `NOT NULL`

## 🛠 How to Use

1.  **Rebuild the Database Structure:**
    ```bash
    psql -U postgres < worldcup.sql
    ```

2.  **Run the Data Insertion Script:**
    ```bash
    ./insert_data.sh
    ```

3.  **Run the Queries:**
    ```bash
    ./queries.sh
    ```


## 📦 Technologies Used
*   **PostgreSQL**: Relational database management.
*   **Bash**: Shell scripting for data automation.
*   **SQL**: Advanced queries.

---
*Developed as part of the freeCodeCamp Relational Database Curriculum.*
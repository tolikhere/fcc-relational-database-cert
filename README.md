# 🎓 FreeCodeCamp: Relational Database Certification

This repository contains my solutions and projects for the [FreeCodeCamp Relational Database Certification](https://www.freecodecamp.org/learn/relational-databases-v9/). This curriculum focuses on mastering **Bash**, **SQL**, and **PostgreSQL** by building complex, interconnected databases and automation scripts.

## 🚀 Projects Overview


| Project Name | Status | Tech Stack | Key Features |
| :--- | :--- | :--- | :--- |
| [**Celestial Bodies DB**](./celestial-bodies-db/) | ✅ Complete | PostgreSQL | 5-table hierarchy (Galaxy → Star → Planet → Moon) + Custom Jedi Academy tracking. |
| **Salon Scheduler** | ⏳ In Progress | Bash / SQL | Appointment booking system using shell scripting and database queries. |
| **World Cup DB** | 📅 Upcoming | SQL / CSV | Data processing and advanced querying of tournament results. |
| **Periodic Table DB** | 📅 Upcoming | SQL / Bash | Database of elements with chemical properties and state tracking. |
| **Number Guessing Game** | 📅 Upcoming | Bash / SQL | A CLI game that tracks user high scores and games played in a database. |

---

## 🌌 Featured Project: Celestial Bodies Database

The first major milestone of this certification involved designing a relational model of a universe from scratch.

### ✨ Database Highlights:
- **Hierarchical Structure:** A clean 1-to-Many chain connecting Galaxies, Stars, Planets, and Moons.
- **Custom Logic:** Added a `jedi_academy` table to track student counts and years founded on specific planets.
- **Strict Data Integrity:** Implemented `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, and `NOT NULL` constraints across 50+ rows of data.
- **Precision Data:** Used `NUMERIC(9,3)` for astronomical distances and `NUMERIC(8,4)` for solar masses to ensure scientific accuracy.

### 🛠 How to Rebuild the Database:
To recreate this universe in your local PostgreSQL instance:
1. Clone the repository.
2. Run the following command in your terminal:
   ```bash
   psql -U postgres < celestial-bodies-db/universe.sql

# 🌌 Celestial Bodies Database

This project is a comprehensive relational model of a universe, built as part of the [FreeCodeCamp Relational Database Certification](https://www.freecodecamp.org/learn/relational-databases-v9/). The first major milestone of this certification involved designing a relational model of a universe from scratch.

## 🏛 Database Schema

The database consists of **5 tables** with a strictly enforced 1-to-Many hierarchy:

1.  **`galaxy`**: The top-level container (Milky Way, Andromeda, etc.).
2.  **`star`**: Solar bodies linked to a specific galaxy via `galaxy_id`.
3.  **`planet`**: Planets orbiting specific stars via `star_id`.
4.  **`moon`**: Natural satellites orbiting planets via `planet_id`.
5.  **`jedi_academy`**: A custom table tracking student counts and academy status on specific planets.

## 🛠 Technical Implementation

### ✨ Data Integrity & Constraints
- **Primary Keys:** Every table uses a `SERIAL` auto-incrementing integer for unique identification.
- **Foreign Keys:** Enforced referential integrity ensures that no moon exists without a planet, no planet without a star, etc.
- **Unique Constraints:** All celestial bodies and academies have `UNIQUE` name constraints to prevent data duplication.

### ✨ Database Highlights:
- **Hierarchical Structure:** A clean 1-to-Many chain connecting Galaxies, Stars, Planets, and Moons.
- **Custom Logic:** Added a `jedi_academy` table to track student counts and years founded on specific planets.
- **Strict Data Integrity:** Implemented `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, and `NOT NULL` constraints.
- **Precision Data:** Used `NUMERIC(9,3)` for astronomical distances and `NUMERIC(8,4)` for solar masses to ensure scientific accuracy.

### ✨ Featured Query
To see the full hierarchy of the universe, including our Jedi students, I use the following Join:

```sql
SELECT 
    g.name AS galaxy,
    s.name AS star,
    p.name AS planet,
    m.name AS moon,
    a.name AS academy,
    a.student_count AS students
FROM galaxy g
LEFT JOIN star s ON g.galaxy_id = s.galaxy_id
LEFT JOIN planet p ON s.star_id = p.star_id
LEFT JOIN moon m ON p.planet_id = m.planet_id
LEFT JOIN jedi_academy a ON p.planet_id = a.planet_id
ORDER BY g.name, s.name, p.name;
```


## 📦 How to Rebuild the Database:
To recreate this universe in your local PostgreSQL instance:
1. Clone the repository.
2. Run the following command in your terminal:
   ```bash
   psql -U postgres < universe.sql
   ```
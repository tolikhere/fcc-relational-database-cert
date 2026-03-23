# 🌌 Celestial Bodies Database

This project is a comprehensive relational model of a universe, built as part of the FreeCodeCamp Relational Database Certification. It explores complex data relationships, scientific measurements, and custom organizational tracking.

## 🏛 Database Schema

The database consists of **5 tables** with a strictly enforced 1-to-Many hierarchy:

1.  **`galaxy`**: The top-level container (Milky Way, Andromeda, etc.).
2.  **`star`**: Solar bodies linked to a specific galaxy via `galaxy_id`.
3.  **`planet`**: Planets orbiting specific stars via `star_id`.
4.  **`moon`**: Natural satellites orbiting planets via `planet_id`.
5.  **`jedi_academy`**: A custom table tracking student counts and academy status on specific planets.

## 🛠 Technical Implementation

### Data Integrity & Constraints
- **Primary Keys:** Every table uses a `SERIAL` auto-incrementing integer for unique identification.
- **Foreign Keys:** Enforced referential integrity ensures that no moon exists without a planet, no planet without a star, etc.
- **Unique Constraints:** All celestial bodies and academies have `UNIQUE` name constraints to prevent data duplication.
- **Data Types:** 
  - `NUMERIC(9,3)` for distances in Millions of Light Years (Mly).
  - `NUMERIC(8,4)` for Star Mass in Solar Masses.
  - `BOOLEAN` flags for `has_life`, `is_spherical`, and `is_active`.

### Featured Query
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


##  Project Structure

BookMyShow-DB-CaseStudy
├── README.md
├── BookMyShow.sql
└── Solution_Document.docx

## Project Overview
This project provides a database solution for a BookMyShow-like movie ticketing platform, where users can book tickets for movie shows.  
For a selected theatre, users can view shows for the next 7 days. Selecting a date displays all shows running in that theatre along with their timings.

---

## Problem Statement
**P1:** Identify entities, their attributes, and create normalized database tables (1NF → BCNF).  
- Write SQL queries to create tables.  
- Insert sample data to demonstrate functionality.

**P2:** Write a SQL query to list all shows for a given theatre on a specific date along with show timings.

---

## Solution Summary
- **Entities Identified:** Movie, Theatre, Screen, Show  
- **Tables Created:** movie, theatre, screen, show  
- **Normalization:** Tables follow 1NF, 2NF, 3NF, and BCNF rules  
- **Sample Data:** Inserted for movies, theatres, screens, and shows  
- **Queries:** Provided in `BookMyShow.sql`


## 🗄Database Schema  
- Schema: `mydb`  
- Tables: `movie`, `theatre`, `screen`, `show`  
- SQL file: **BookMyShow.sql** (includes table creation, sample inserts, and queries)  

---

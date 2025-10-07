# 🏫 MurachCollege SQL Queries — Assignment 3
**By Hebatallah Tharhan**  
*CIS111 Assignment 3 — MurachCollege Database*

---

### 📘 Overview
This repository contains SQL queries written for **CIS111 Assignment 3**, using the **Cis111_MurachCollege** database.  
The focus is on **joins, grouping, aggregates, subqueries, CTEs, and tuition calculations**.

---

### 🧠 Key Concepts Demonstrated
- Inner joins, left joins, and cross joins  
- Aggregation functions: `COUNT()`, `SUM()`, `MAX()`, `AVG()`  
- Grouping with `GROUP BY` and filtering with `HAVING`  
- Subqueries to filter based on conditions  
- Common Table Expressions (CTEs) to handle full-time students  
- Calculating tuition costs using CTE results and cross joins  
- Using `DISTINCT` and `NOT EXISTS` to find unique or missing relationships  
- String concatenation using `CONCAT` and `ISNULL`  

---

### 💾 File Contents
**`assignment3.sql`**

Includes:
1. Count of instructors per department & highest-paid instructor  
2. Number of courses and sum of course units per instructor  
3. Number of students per course & department  
4. Rollup of courses taught by active instructors  
5. Instructors who teach courses (distinct)  
6. Instructors earning above average salary  
7. Instructors not teaching any courses  
8. Full-time student tuition calculation using CTE  

---

### 🧭 Database Used
**Database:** `Cis111_MurachCollege`  
Tables involved:
- `Departments`  
- `Instructors`  
- `Courses`  
- `Students`  
- `StudentCourses`  
- `Tuition`  

---

### 📚 License
For educational purposes only — part of CIS111 coursework.

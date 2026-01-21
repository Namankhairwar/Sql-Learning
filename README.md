# Sql-Learning
# SQL Learning Journey 🚀

This repository contains my structured SQL learning and practice using a real-world schema (`worker` and `project`).  
The goal of this repository is to build a strong foundation in SQL by practicing queries topic-wise, from basics to advanced concepts.

---

## 📂 Schema Used

### Worker Table
- emp_id (Primary Key)
- emp_name
- emp_dept
- emp_salary

### Project Table
- pid (Primary Key)
- emp_id (Foreign Key → worker.emp_id)
- project_name
- location

This schema is consistently used across all queries to maintain real-world relevance.

---

## 📚 Topics Covered

### 1️⃣ SQL Basics
- SELECT, WHERE
- ORDER BY
- LIKE
- IN / NOT IN
- BETWEEN
- NULL & NOT NULL

### 2️⃣ Aggregate Functions
- COUNT
- SUM
- AVG
- MIN / MAX
- GROUP BY
- HAVING
- Aggregate queries using worker–project schema

### 3️⃣ Subqueries
- IN & NOT IN subqueries
- EXISTS & NOT EXISTS
- Scalar subqueries
- Correlated subqueries
- Nested subqueries
- Real interview-style problems

### 4️⃣ Joins
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- CROSS JOIN
- NATURAL JOIN
- Join vs Subquery comparison
- Join + Aggregate queries

---

## 🧠 Key Learnings

- Difference between `IN`, `EXISTS`, and JOINs
- Handling NULL values safely
- Writing optimized and readable SQL queries
- Solving real interview and LeetCode-style SQL problems
- Understanding when to use subqueries vs joins

---

## 📁 Repository Structure


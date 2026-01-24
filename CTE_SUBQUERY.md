### 🔹 Subqueries
A **subquery** is a query nested inside another SQL query.

**Key Points**
- Written inside `SELECT`, `FROM`, `WHERE`, or `HAVING`
- Usually used once
- Can be **scalar**, **multi-row**, or **correlated**
- Harder to read in complex queries

**Example**
```sql
SELECT name
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
```
# Common Table Expressions (CTEs)

A **CTE (Common Table Expression)** is a temporary named result set that can be referenced within a single SQL statement.  
It is defined using the `WITH` keyword and helps make complex queries easier to read and maintain.

---

## Syntax

```sql
WITH cte_name AS (
    SELECT column1, column2
    FROM table_name
    WHERE condition
)
SELECT *
FROM cte_name;
```

### Subquery vs CTE

- **Subquery** → inline, single-use, harder to read  
- **CTE** → named, reusable, cleaner, supports recursion  





# Handling NULL Values in SQL

NULL represents **missing, unknown, or not applicable data** in SQL.

---

## What is NULL?

- NULL means **no value**
- NULL is **not equal** to:
  - `0`
  - empty string `''`
  - `FALSE`

Any comparison with NULL results in **UNKNOWN**.

---

## COUNT and NULL Values

```sql
COUNT(column)   -- ignores NULL values
COUNT(*)        -- counts all rows
```

## IS NULL and IS NOT NULL

```sql
-- IS NULL
SELECT *
FROM employees
WHERE salary IS NULL;
```

```sql
-- IS NOT NULL
SELECT *
FROM employees
WHERE salary IS NOT NULL;
```

### What is COALESCE?

`COALESCE()` returns the **first non-NULL value** from a list of expressions.

---

#### Syntax

```sql
COALESCE(expr1, expr2, expr3, ...)
```

### What is NULLIF?

`NULLIF()` returns **NULL** if the two expressions are equal; otherwise it returns the **first** expression.

---

#### Syntax

```sql
NULLIF(expression1, expression2)
```

### Example: ON vs WHERE Condition with NULL Values

#### Example Tables

**employees**

| emp_id | emp_name | dept_id |
|------|----------|--------|
| 1 | Alice | 10 |
| 2 | Bob | NULL |
| 3 | Charlie | 20 |

**departments**

| dept_id | dept_name |
|--------|-----------|
| 10 | HR |
| 20 | IT |

---

## Condition in ON Clause (Correct)

```sql
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
AND d.dept_name = 'HR';
```

| emp_id | emp_name | dept_name |
|------|----------|----------|
| 1 | Alice | HR |
| 2 | Bob | NULL |
| 3 | Charlie | NULL |


## Condition in WHERE Clause

```sql
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'HR';
```

| emp_id | emp_name | dept_name |
|------|----------|----------|
| 1 | Alice | HR |


## Using ON Clause to Preserve NULL Values

To avoid missing rows with `NULL` values when using JOINs, place conditions on the joined (optional) table in the `ON` clause instead of the `WHERE` clause.

---

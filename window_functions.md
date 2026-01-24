### Window Function (SQL)

A **window function** performs a calculation across a set of rows called a *window*, **without collapsing the result set** like group by.

**Syntax:**
```sql
function_name(expression)
OVER (
  PARTITION BY column_name
  ORDER BY column_name
)
```
### ROW_NUMBER() — Example

`ROW_NUMBER()` assigns a **unique number** to each row within a partition.

**Syntax:**
```sql
ROW_NUMBER() OVER (
  PARTITION BY column_name
  ORDER BY column_name
)
```
### RANK() — Definition & Example

`RANK()` 
**Tied values receive the same rank**, and the next rank is **skipped**.

**Syntax:**
```sql
RANK() OVER (
  PARTITION BY column_name
  ORDER BY column_name
)
```
### DENSE_RANK() — Definition & Example

`DENSE_RANK()`
**Tied values receive the same rank**, but **no ranks are skipped**.

**Syntax:**
```sql
DENSE_RANK() OVER (
  PARTITION BY column_name
  ORDER BY column_name
)
```
### LEAD() — Get Next Row Value

`LEAD()` is a window function used to **access the value from the next row** within the same result set, without using a self-join.

**Syntax:**
```sql
LEAD(column_name, offset, default_value)
OVER (
  PARTITION BY column_name
  ORDER BY column_name
)
```
### LAG() — Get Previous Row Value

`LAG()` is a window function used to **access the value from the previous row** in the result set, without using a self-join.

**Syntax:**
```sql
LAG(column_name, offset, default_value)
OVER (
  PARTITION BY column_name
  ORDER BY column_name
)
```

### Aggregate Window Functions — SUM, COUNT, MIN, MAX, AVG (Combined Example)

Aggregate window functions perform calculations over a window of rows while **preserving each row** in the result set.

---

### Table: `employees`

| id | name  | department | salary |
|----|-------|------------|--------|
| 1  | Asha  | IT         | 90000 |
| 2  | Ravi  | IT         | 85000 |
| 3  | Neha  | HR         | 70000 |
| 4  | Kiran | HR         | 75000 |

---

### Query 

```sql
SELECT
  id,
  name,
  department,
  salary,
  SUM(salary)   OVER (PARTITION BY department) AS dept_salary_sum,
  COUNT(*)      OVER (PARTITION BY department) AS dept_emp_count,
  MIN(salary)   OVER (PARTITION BY department) AS dept_min_salary,
  MAX(salary)   OVER (PARTITION BY department) AS dept_max_salary,
  AVG(salary)   OVER (PARTITION BY department) AS dept_avg_salary
FROM employees;
```

### ROWS BETWEEN x AND y — Simple Explanation

`ROWS BETWEEN x AND y` defines a **window of rows** around the current row.

- **x** → where the window **starts**
- **y** → where the window **ends**

The window is always **relative to the current row**.

---

## Possible values for x (START)

| x option | Meaning |
|--------|--------|
| `a PRECEDING` | Start **a rows before** the current row |
| `CURRENT ROW` | Start **at the current row** |
| `UNBOUNDED PRECEDING` | Start from the **first row** of the partition |

---

## Possible values for y (END)

| y option | Meaning |
|--------|--------|
| `b FOLLOWING` | End **b rows after** the current row |
| `CURRENT ROW` | End **at the current row** |
| `UNBOUNDED FOLLOWING` | End at the **last row** of the partition |

---

## General Syntax

```sql
ROWS BETWEEN x AND y

# SQL Query Optimization Guide

SQL optimization - reduces execution time, minimizes database storage.

---

## 1. Use Indexes Effectively

Indexes speed up data retrieval by avoiding full table scans. It has the address.
primary keys don't require an index.

### Index
- Index the columns in where, join, orderby and groupby clause
- In case of multiple columns, use composite index(Order is important)
- Avoid over indexing(like which has low cardinal value)
- primary key columns don't require any index
- Don't use unnecessary columns in select statement
- If functions are applied on columns, index cannot be created
- Use In instead of or if possible
- use explain and explain analyze
- (caching) Store frequently executed query data in redis, so when it receives a request, first cache is checked.


```sql
CREATE INDEX idx_user_email ON users(x/x,y);
```

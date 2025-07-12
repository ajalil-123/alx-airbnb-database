
### 1. Query Monitoring Using `EXPLAIN ANALYZE`

```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';
```

* **Execution Strategy**: Full table scan
* **Estimated Cost**: 0.35
* **Estimated Rows**: 1
* **Actual Time**: 0.673 ms
* **Actual Rows Returned**: 0
* **Filter Used**: `start_date BETWEEN '2025-01-01' AND '2025-12-31'`

---

### 2. Identified Bottlenecks

* No index on `start_date` led to full table scans.
* MySQL 8.0 does not support foreign keys on partitioned InnoDB tables, blocking use of partitioning.

---

### 3. Implemented Changes

```sql
CREATE INDEX idx_start_date ON bookings(start_date);
```

* Index added to support range queries on `start_date`.
* Partitioning skipped due to foreign key limitations.
* Suggested archival strategy for older data instead of partitioning.

---

### 4. Improvement Results

After adding the index:

```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';
```

* **Old Plan**: Full table scan
* **New Plan**: Index range scan using `idx_start_date`
* **Cost Reduced**: From 0.35 to 0.20
* **Execution Time Reduced**: From 0.673 ms to \~0.23 ms

---

### 5. Recommendations

* Use `EXPLAIN ANALYZE` regularly on slow queries.
* Archive bookings older than 2024 into a separate table.
* Use `ANALYZE TABLE` after major data changes.
* Monitor slow query logs and add indexes as needed.

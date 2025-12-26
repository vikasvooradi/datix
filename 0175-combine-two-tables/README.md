## Table: Person

| Column Name | Type    |
|------------|---------|
| personId   | int     |
| lastName   | varchar |
| firstName  | varchar |

- **Primary Key**: `personId`
- This table contains information about the ID of some persons and their first and last names.

---

## Table: Address

| Column Name | Type    |
|------------|---------|
| addressId  | int     |
| personId   | int     |
| city       | varchar |
| state      | varchar |

- **Primary Key**: `addressId`
- Each row contains information about the city and state of one person with ID = `personId`.

---

## Problem Statement

Write a solution to report the **first name**, **last name**, **city**, and **state** of each person in the `Person` table.

- If the address of a `personId` is not present in the `Address` table, report **NULL** instead.
- Return the result table in **any order**.

---

## Example 1

### Input

**Person table:**

| personId | lastName | firstName |
|---------:|----------|-----------|
| 1        | Wang     | Allen     |
| 2        | Alice    | Bob       |

**Address table:**

| addressId | personId | city          | state      |
|----------:|---------:|---------------|------------|
| 1         | 2        | New York City | New York   |
| 2         | 3        | Leetcode      | California |

---

### Output

| firstName | lastName | city          | state    |
|-----------|----------|---------------|----------|
| Allen     | Wang     | NULL          | NULL     |
| Bob       | Alice    | New York City | New York |

---

### Explanation

- There is no address for `personId = 1`, so `city` and `state` are returned as **NULL**.
- `addressId = 1` contains address information for `personId = 2`.

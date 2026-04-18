# Day 3 - VLOOKUP (Excel)

## What is VLOOKUP?

VLOOKUP (Vertical Lookup) is used to search for a value in the first column of a table 
and return a corresponding value from another column.

---

## Syntax

=VLOOKUP(lookup_value, table_array, col_index_num, [range_lookup])

---

## Explanation

- lookup_value → Value to search (e.g., Customer_ID)
- table_array → Table where data is present
- col_index_num → Column number from which value is returned
- range_lookup → FALSE for exact match

---

## Example

=VLOOKUP(B2, Sheet2!$A$2:$C$6, 2, FALSE)

- Looks for Customer_ID in column A
- Returns Customer_Name from column 2

---

## Important Points

- Always lock the table range using `$`
  Example: $A$2:$C$6

- Column number is counted within the selected range
  (not actual Excel column letters)

- VLOOKUP only works left to right

---

## Handling Errors

If value is not found, VLOOKUP returns `#N/A`

To handle this:

=IFERROR(VLOOKUP(B2, Sheet2!$A$2:$C$6, 2, FALSE), "Not Found")

---

## Real-World Use Case

- Combining data from multiple tables
- Fetching customer details from another dataset
- Data cleaning and validation

---

## Insight

- VLOOKUP helps in merging datasets efficiently
- Missing values indicate incomplete or mismatched data

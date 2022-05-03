SELECT *
FROM 'tableName'
ORDER BY ID
OFFSET n ROWS FETCH NEXT m ROWS ONLY;
n - rows to skip
m - count rows get
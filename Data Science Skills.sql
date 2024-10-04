-- soln #1
-- this works but won't work in case of duplicate records
SELECT candidate_id FROM candidates
WHERE LOWER(skill) IN ('python','tableau','postgresql')
GROUP BY candidate_id
HAVING COUNT(skill) >= 3
ORDER BY candidate_id;


-- soln #2
-- better soln
SELECT candidate_id FROM candidates
WHERE LOWER(skill) IN ('python','tableau','postgresql')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) >= 3
ORDER BY candidate_id;


-- soln #3
-- using intersect
SELECT candidate_id FROM candidates WHERE LOWER(skill) = 'python'
INTERSECT
SELECT candidate_id FROM candidates WHERE LOWER(skill) = 'tableau'
INTERSECT
SELECT candidate_id FROM candidates WHERE LOWER(skill) = 'postgresql'


-- soln #4
-- using nested subquery
SELECT candidate_id 
FROM candidates 
WHERE candidate_id IN (
    SELECT candidate_id 
    FROM candidates 
    WHERE candidate_id IN (
        SELECT candidate_id 
        FROM candidates 
        WHERE LOWER(skill) = 'python'
    )
    AND LOWER(skill) = 'tableau'
)
AND LOWER(skill) = 'postgresql';

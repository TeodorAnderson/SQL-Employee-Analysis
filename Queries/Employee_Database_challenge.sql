SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as t ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) first_name,
last_name,
title


INTO uniquetitles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no ASC, to_date DESC;

select count (title), title
into retiringtitles
from uniquetitles
group by title
order by count(title) desc;

SELECT DISTINCT ON(emp_no) e.emp_no,
        e.first_name,
        e.last_name,
        e.birth_date,
        de.from_date,
        de.to_date,
        ti.title

INTO mentor_table
FROM employees AS e

    INNER JOIN dept_emp AS de
      ON (e.emp_no = de.emp_no)
    INNER JOIN titles AS ti
      ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
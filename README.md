# WQD7001
Principle of Data Science


# Github common commands
// Create a new branch
git checkout -b 'branch-name'

// Move to the desired branch
git checkout 'branch-name'

// To check for all the branches Remote and local (Remove -a to only view local branch)
git branch -a

// Push the new branch to repo. Use this common only once to let the repo create branch with same name.
git push -u origin 'branch-name'

// delete branch locally
git branch -d localBranchName

// delete branch remotely
git push origin --delete remoteBranchName

# Parents' Education Background and Children's Success

Do students with highly educated parents tend to score better in Math?
I.	Do parents’ education background correlate with student’s grade in the Math subject?
II.	Do parents’ education background correlate with student’s past class failures?
III.	Do parents’ education background affect student’s total study time?
IV.	Do students with highly educated parents tend to be more ambitious and pursue higher education

Attributes for both student-mat.csv (Math course)

##### sex - student's sex (binary: 'F' - female or 'M' - male)
##### age - student's age (numeric: from 15 to 22)
##### Pstatus - parent's cohabitation status (binary: 'T' - living together or 'A' - apart)
##### Medu - mother's education (numeric: 0 - none, 1 - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education or 4 – higher education)
##### Fedu - father's education (numeric: 0 - none, 1 - primary education (4th grade), 2 – 5th to 9th grade, 3 – secondary education or 4 – higher education)
##### Mjob - mother's job (nominal: 'teacher', 'health' care related, civil 'services' (e.g. administrative or police), 'at_home' or 'other')
##### Fjob - father's job (nominal: 'teacher', 'health' care related, civil 'services' (e.g. administrative or police), 'at_home' or 'other')
##### studytime - weekly study time (numeric: 1 - <2 hours, 2 - 2 to 5 hours, 3 - 5 to 10 hours, or 4 - >10 hours)
##### failures - number of past class failures (numeric: n if 1<=n<3, else 4)
##### paid - extra paid classes within the course subject (Math or Portuguese) (binary: yes or no)
##### activities - extra-curricular activities (binary: yes or no)
##### higher - wants to take higher education (binary: yes or no)
##### internet - Internet access at home (binary: yes or no)
##### romantic - with a romantic relationship (binary: yes or no)
##### famrel - quality of family relationships (numeric: from 1 - very bad to 5 - excellent)
##### health - current health status (numeric: from 1 - very bad to 5 - very good)
##### absences - number of school absences (numeric: from 0 to 93)

These grades are related with the course subject, Math:

##### G1 - first period grade (numeric: from 0 to 20)
##### G2 - second period grade (numeric: from 0 to 20)
##### G3 - final grade (numeric: from 0 to 20, output target)
##### AverageScore - average of sum of G1, G2 and G3 for each student (numeric: from 0 to 20)

Kaggle dataset: https://www.kaggle.com/datasets/uciml/student-alcohol-consumption

--Identifying 1st FullTime Student by EnrollmentDate for possible Scholarship
SELECT 
		TOP 10 percent
		StudentID
		,EnrollmentDate
		,EnrollmentStatus
	FROM
		Students
	ORDER BY EnrollmentDate ASC
    GO

--Joining 2 Tables to See all FullTime Students by Courses
    SELECT
	S.StudentID
	,S.EnrollmentDate
	,S.EnrollmentStatus
FROM 
	Students S
	JOIN
		StudentCourses SC
		ON
			S.StudentID = SC.StudentID
WHERE EnrollmentStatus = 'FullTime'
GO

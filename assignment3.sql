USE Cis111_MurachCollege
--Hebatallah Tharhan Assigmnet 3 upload--
--Query 1--
SELECT dbo.Departments.DepartmentName, COUNT(dbo.Instructors.InstructorID) as [Count of Instructors], MAX(dbo.Instructors.AnnualSalary) as [Highest paid instructor]
From dbo.Departments
	Inner Join 
		Instructors on dbo.Departments.DepartmentID = dbo.Instructors.DepartmentID
Group By dbo.Departments.DepartmentName
Having COUNT(dbo.Instructors.InstructorID) > 0
Order by [Count of Instructors] desc

--Query 2--
Select CONCAT(ISNULL(dbo.Instructors.FirstName, ''), ' ', dbo.Instructors.LastName) as InstructorName, COUNT(dbo.Courses.CourseID) as [Number of Courses], SUM(dbo.Courses.CourseUnits) as [Sum of Course Units]
From dbo.Instructors
	Inner join 
		Courses on dbo.Instructors.InstructorID = dbo.Courses.InstructorID
Group By CONCAT(ISNULL(dbo.Instructors.FirstName, ''), ' ', dbo.Instructors.LastName)

Order By [Sum of Course Units] desc; 

--Query 3--

Select dbo.Departments.DepartmentName as [Department Name], dbo.Courses.CourseDescription as [Course Description], COUNT(dbo.StudentCourses.StudentID) as [Number of Students]
From dbo.Departments
	inner join Courses on dbo.Departments.DepartmentID = dbo.Courses.DepartmentID
	inner join StudentCourses on dbo.Courses.CourseID = dbo.StudentCourses.CourseID

Group by dbo.Departments.DepartmentName, dbo.Courses.CourseDescription
Order by dbo.Departments.DepartmentName, [Number of Students];

--Query 4--

Select dbo.Instructors.Status, ISNULL(dbo.Instructors.LastName,'')+ ISNULL(' ' + dbo.Instructors.FirstName, '') as [Instructor Name], COUNT(dbo.Courses.CourseID) [Total number of Courses taught]
From dbo.Instructors
		Inner join Courses on dbo.Instructors.InstructorID=dbo.Courses.InstructorID
Where dbo.Instructors.Status = 'P'
Group by dbo.Instructors.Status , ISNULL(dbo.Instructors.LastName,'')+ ISNULL(' ' +dbo.Instructors.FirstName, '') with ROLLUP

--Query 5--
SELECT DISTINCT LastName, FirstName
From Instructors 
Where InstructorID in (SELECT InstructorID from Courses )

--Query 6--
Select LastName, FirstName,  AnnualSalary
From Instructors
Where AnnualSalary > (Select AVG(AnnualSalary) from Instructors )
Order by AnnualSalary DESC;
--Query 7--
Select LastName, FirstName
From Instructors i
Where  NOT EXISTS (Select * from Courses c where i.InstructorID = c.InstructorID  )
Order by LastName, FirstName
--Query 8--
Select dbo.Students.StudentID, SUM(dbo.Courses.CourseUnits) as [Sum of Course Units]
From dbo.Students inner join StudentCourses on dbo.Students.StudentID = dbo.StudentCourses.StudentID
inner join Courses on dbo.Courses.CourseID = dbo.StudentCourses.CourseID
Group by  dbo.Students.StudentID
HAVING SUM(dbo.Courses.CourseUnits) > 9;

With FullTimeStudent As
(
Select dbo.Students.StudentID, SUM(dbo.Courses.CourseUnits) as TotalUnits
From dbo.Students inner join StudentCourses on dbo.Students.StudentID = dbo.StudentCourses.StudentID
inner join Courses on dbo.Courses.CourseID = dbo.StudentCourses.CourseID
Group by  dbo.Students.StudentID
HAVING SUM(dbo.Courses.CourseUnits) > 9
)

Select fts.StudentID, fts.TotalUnits, (t.FullTimeCost + t.PerUnitCost * fts.TotalUnits) as TutionCost
From FullTimeStudent fts
Cross Join Tuition t;



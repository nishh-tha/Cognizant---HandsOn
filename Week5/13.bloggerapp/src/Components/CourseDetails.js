function CourseDetails() {
  const courses = [
    {
      id: 1,
      course: "React JS",
      duration: "30 Days",
    },
    {
      id: 2,
      course: "Java Full Stack",
      duration: "45 Days",
    },
    {
      id: 3,
      course: "Spring Boot",
      duration: "20 Days",
    },
  ];

  return (
    <div>
      <h2>Course Details</h2>

      {courses.map((course) => (
        <div key={course.id}>
          <h4>{course.course}</h4>
          <p>{course.duration}</p>
        </div>
      ))}
    </div>
  );
}

export default CourseDetails;
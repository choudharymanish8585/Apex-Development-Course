SFDCFactsAcademyService service = new SFDCFactsAcademyService();

// Get all courses of SFDCFacts Academy
System.debug('****CALLING /courses API TO GET ALL COURSES****');
service.getAllCourses();

// Get one course with course Id
System.debug('****CALLING /courses/{courseId} API TO GET A SPECIFIC COURSE getCourseById****');
service.getCourseById();

// Get all instructors
System.debug('****CALLING /instructors API TO GET ALL COURSES****');
service.getAllInstructors();

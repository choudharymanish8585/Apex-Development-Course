public with sharing class SFDCFactsAcademyService {
    // Get all courses by calling /courses api
    public void getAllCourses() {
        ExternalService.SFDCFactsAcademyCourses service = new ExternalService.SFDCFactsAcademyCourses();

        // make callout
        ExternalService.SFDCFactsAcademyCourses.getCourses_Response courses = service.getCourses();

        // Iterate over the resultset
        if (courses.Code200.size() > 0) {
            for (ExternalService.SFDCFactsAcademyCourses_Course course : courses.Code200) {
                System.debug('Course Id: ' + course.id);
                System.debug('Course Title: ' + course.title);
                System.debug('Course Description: ' + course.description);
                System.debug('Course InstructorId: ' + course.instructorId);
                System.debug('Course Category: ' + course.category);
                System.debug('Course Duration: ' + course.duration);
            }
        }
    }

    // Get specific course by Id by calling /courses/{courseId} api
    public void getCourseById() {
        ExternalService.SFDCFactsAcademyCourses service = new ExternalService.SFDCFactsAcademyCourses();

        ExternalService.SFDCFactsAcademyCourses.getCoursesByCourseId_Request request = new ExternalService.SFDCFactsAcademyCourses.getCoursesByCourseId_Request();
        request.courseId = 'course1';

        // make callout
        ExternalService.SFDCFactsAcademyCourses.getCoursesByCourseId_Response response = service.getCoursesByCourseId(request);
        ExternalService.SFDCFactsAcademyCourses_Course course = response.Code200;
        if (course != null) {
            System.debug('Course Id: ' + course.id);
            System.debug('Course Title: ' + course.title);
            System.debug('Course Description: ' + course.description);
            System.debug('Course InstructorId: ' + course.instructorId);
            System.debug('Course Category: ' + course.category);
            System.debug('Course Duration: ' + course.duration);
        }
    }

    // Todo: Add getInstructors
    // Get all courses by calling /courses api
    public void getAllInstructors() {
        ExternalService.SFDCFactsAcademyCourses service = new ExternalService.SFDCFactsAcademyCourses();

        // make callout
        ExternalService.SFDCFactsAcademyCourses.getInstructors_Response instructors = service.getInstructors();

        // Iterate over the resultset
        if (instructors.Code200.size() > 0) {
            for (ExternalService.SFDCFactsAcademyCourses_Instructor instructor : instructors.Code200) {
                System.debug('Instructor Id: ' + instructor.id);
                System.debug('Instructor Name: ' + instructor.name);
                System.debug('Instructor Bio: ' + instructor.bio);
            }
        }
    }
}

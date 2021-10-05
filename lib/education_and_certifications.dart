class School {
  final String name;
  final String years;
  final String study;

  School({required this.name, required this.years, required this.study});
}

class Certificate {
  final String course;
  final String author;
  final String url;

  Certificate({required this.course, required this.author, required this.url});
}

List<Certificate> certificates = [
  Certificate(
      course: 'Computer Science Career Path',
      author: 'Codecademy',
      url: 'https://www.codecademy.com/learn/paths/computer-science'),
  Certificate(
      course: 'Full-Stack Software Engineer',
      author: 'Codecademy',
      url:
          'https://www.codecademy.com/learn/paths/full-stack-engineer-career-path'),
  Certificate(
      course: 'Data Scientist',
      author: 'Codecademy',
      url: 'https://www.codecademy.com/learn/paths/data-science'),
  Certificate(
      course: 'The Complete 2021 Flutter Development Bootcamp with Angela Yu',
      author: 'Dr. Angela Yu',
      url:
          'https://www.udemy.com/share/101Xwi3@T6zg4XhE3DUHI5kKd0PRMzclx2P5xf0WU71kUAUwkUExc_syKlRyEm1FTq5ZPgog/'),
  Certificate(
      course: 'Python and Django Full Stack Web Developer Bootcamp',
      author: 'Jose Portilla',
      url:
          'https://www.udemy.com/share/101WwE3@4EUq91lqMsOHFmCDXlJnSkFWg4ElHur_g2Mw-oAaXiPojmmpHqgxfDdJNz_Ot4Qo/'),
  Certificate(
      course: 'Learn Python Programming Masterclass',
      author: 'Time Buchalka',
      url:
          'https://www.udemy.com/share/101Wac3@2_oaZkY2VZ4M3gFVJkv6FYp9bWrNHxf4IujXoe_SRnlKr7UpMUTZxeaxssGozBvE/'),
  Certificate(
      course: 'Unreal Engine C++ Developer',
      author: 'Ben Tristem, GameDev.tv',
      url:
          'https://www.udemy.com/share/101XRs3@F8aBHZb1l0SD4c041CGO4oZ9fW_x7P_YLZsOLEBK94ykYvB8DafrETUGWOpR-pUG/'),
  
];

List<School> schools = [
  School(
    name: 'United States Naval Academy',
    years: '2012-2014',
    study:
        'Completed Coursework towards Bachelor of Science Systems Engineering',
  ),
  School(
    name: 'West Texas A&M',
    years: '2014-2016',
    study: 'Bachelor of Science Sports and Exercise Sciences',
  ),
  School(
    name: 'University of Texas at Arlington',
    years: '2017-2018',
    study: 'Completed coursework towards Bachelor of Science Computer Science',
  )
];

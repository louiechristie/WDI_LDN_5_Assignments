INSERT INTO students (first, last, dob, gpa) VALUES ('bill', 'jones', '1/1/1990', 3.1);
  INSERT INTO students (first, last, dob, gpa) VALUES ('sally', 'jones', '1/1/1950', 3.6);
  INSERT INTO students (first, last, dob, gpa) VALUES ('sue', 'smith', '1/1/2013', 2.6);
  SELECT * FROM students;
 
  INSERT INTO classes (name) VALUES ('Biology');
  INSERT INTO classes (name) VALUES ('Chemistry');
  INSERT INTO classes (name) VALUES ('Physics');
  SELECT * FROM classes;
 
  INSERT INTO schedules (student_id, class_id) VALUES (2, 3);
  INSERT INTO schedules (student_id, class_id) VALUES (2, 1);
  INSERT INTO schedules (student_id, class_id) VALUES (2, 2);
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2024 at 11:48 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studentinformationsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `applicants`
--

CREATE TABLE `applicants` (
  `applicant_id` int(11) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `other_names` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `pob` varchar(50) NOT NULL,
  `sex` enum('Male','Female') NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `nrc_passport` varchar(20) NOT NULL,
  `postal_address` text NOT NULL,
  `residential_address` text NOT NULL,
  `tel_cell` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `visibility` tinyint(1) DEFAULT 0,
  `mobility` tinyint(1) DEFAULT 0,
  `speech` tinyint(1) DEFAULT 0,
  `hearing` tinyint(1) DEFAULT 0,
  `others` tinyint(1) DEFAULT 0,
  `disability_details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applicants`
--

INSERT INTO `applicants` (`applicant_id`, `surname`, `other_names`, `dob`, `pob`, `sex`, `nationality`, `nrc_passport`, `postal_address`, `residential_address`, `tel_cell`, `email`, `visibility`, `mobility`, `speech`, `hearing`, `others`, `disability_details`) VALUES
(1, 'Smith', 'John', '1990-05-10', 'New York', 'Male', 'American', '12345678', '123 Main St, NY', '456 Elm St, NY', '1234567890', 'john.smith@example.com', 1, 0, 0, 0, 0, 'Partial visibility issue'),
(2, 'Doe', 'Jane', '1995-08-15', 'Los Angeles', 'Female', 'American', '87654321', '456 Park Ave, LA', '789 Oak St, LA', '0987654321', 'jane.doe@example.com', 0, 0, 0, 1, 0, 'Hearing impairment');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `course_description` text DEFAULT NULL,
  `credits` int(11) NOT NULL,
  `program_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `course_description`, `credits`, `program_id`) VALUES
(1, 'Introduction to Programming', 'Basic programming principles', 3, 1),
(2, 'Thermodynamics', 'Study of energy and heat in mechanical systems', 3, 2),
(3, 'Circuit Analysis', 'Fundamentals of electrical circuits', 3, 3),
(4, 'Financial Accounting', 'Basics of accounting in business', 3, 4),
(5, 'Cognitive Psychology', 'Introduction to cognitive processes', 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `education_id` int(11) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `schools` text NOT NULL,
  `exam_number` varchar(20) NOT NULL,
  `exam_body` varchar(50) NOT NULL,
  `exam_year` year(4) NOT NULL,
  `subjects` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`education_id`, `applicant_id`, `schools`, `exam_number`, `exam_body`, `exam_year`, `subjects`) VALUES
(1, 1, 'High School A (2010 - Graduated)', 'ABC123', 'California Board of Education', '2010', 'Math A, English B, Science A'),
(2, 2, 'High School B (2012 - Graduated)', 'XYZ456', 'Texas Board of Education', '2012', 'Math B, English A, History B');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `enrollment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`enrollment_id`, `student_id`, `course_id`, `enrollment_date`) VALUES
(1, 1, 1, '2020-09-01'),
(2, 2, 2, '2019-09-01'),
(3, 3, 3, '2018-09-01'),
(4, 4, 4, '2021-09-01'),
(5, 5, 5, '2022-09-01');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `fee_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `due_date` date NOT NULL,
  `status` enum('Paid','Unpaid') NOT NULL,
  `transaction_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`fee_id`, `student_id`, `amount`, `due_date`, `status`, `transaction_id`) VALUES
(1, 1, 1500.00, '2021-01-15', 'Paid', 'TXN12345'),
(2, 2, 2000.00, '2020-01-15', 'Unpaid', NULL),
(3, 3, 1500.00, '2019-01-15', 'Paid', 'TXN67890'),
(4, 4, 1000.00, '2022-01-15', 'Unpaid', NULL),
(5, 5, 1200.00, '2023-01-15', 'Paid', 'TXN54321');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `grade` char(2) NOT NULL,
  `semester` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade_id`, `student_id`, `course_id`, `grade`, `semester`) VALUES
(1, 1, 1, 'A', 'Fall2020'),
(2, 2, 2, 'B+', 'Fall2019'),
(3, 3, 3, 'A-', 'Fall2018'),
(4, 4, 4, 'B', 'Fall2021'),
(5, 5, 5, 'A', 'Fall2022');

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE `lecturers` (
  `lecturer_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `subject_specialization` varchar(100) DEFAULT NULL,
  `employment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`lecturer_id`, `first_name`, `last_name`, `contact_info`, `subject_specialization`, `employment_date`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'Data Science', '2015-08-20'),
(2, 'Mary', 'Williams', 'mary.williams@example.com', 'Mechanics', '2017-01-15'),
(3, 'James', 'Taylor', 'james.taylor@example.com', 'Power Systems', '2016-05-30'),
(4, 'Linda', 'Brown', 'linda.brown@example.com', 'Business Management', '2019-09-10'),
(5, 'Michael', 'Johnson', 'michael.johnson@example.com', 'Clinical Psychology', '2018-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `professional_qualifications`
--

CREATE TABLE `professional_qualifications` (
  `qualification_id` int(11) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `institution` varchar(100) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `date_obtained` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `professional_qualifications`
--

INSERT INTO `professional_qualifications` (`qualification_id`, `applicant_id`, `institution`, `qualification`, `date_obtained`) VALUES
(1, 1, 'Tech University', 'BSc in Computer Science', '2014-06-15'),
(2, 2, 'Business College', 'Diploma in Business Management', '2016-09-20');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `program_id` int(11) NOT NULL,
  `program_name` varchar(100) NOT NULL,
  `program_duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`program_id`, `program_name`, `program_duration`) VALUES
(1, 'Computer Science', 4),
(2, 'Mechanical Engineering', 4),
(3, 'Electrical Engineering', 4),
(4, 'Business Administration', 3),
(5, 'Psychology', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sponsors`
--

CREATE TABLE `sponsors` (
  `sponsor_id` int(11) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `sponsor_name` varchar(100) NOT NULL,
  `sponsor_address` text NOT NULL,
  `sponsor_relationship` varchar(50) NOT NULL,
  `sponsor_signature` varchar(50) NOT NULL,
  `sponsor_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sponsors`
--

INSERT INTO `sponsors` (`sponsor_id`, `applicant_id`, `sponsor_name`, `sponsor_address`, `sponsor_relationship`, `sponsor_signature`, `sponsor_date`) VALUES
(1, 1, 'Dr. Alice Brown', '789 University Rd, NY', 'Professor', 'Alice Brown', '2023-01-10'),
(2, 2, 'Mr. Robert King', '123 Corporate St, LA', 'Father', 'Robert King', '2023-02-05');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  `gender` enum('M','F','Other') NOT NULL,
  `contact_info` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `admission_date` date NOT NULL,
  `program_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `first_name`, `last_name`, `DOB`, `gender`, `contact_info`, `address`, `admission_date`, `program_id`) VALUES
(1, 'Alice', 'Johnson', '2002-05-10', 'F', 'alice.johnson@example.com', '123 Elm Street', '2020-09-01', 1),
(2, 'Bob', 'Smith', '2001-11-15', 'M', 'bob.smith@example.com', '456 Oak Street', '2019-09-01', 2),
(3, 'Charlie', 'Brown', '2000-08-20', 'M', 'charlie.brown@example.com', '789 Maple Street', '2018-09-01', 3),
(4, 'Diana', 'Evans', '2002-03-30', 'F', 'diana.evans@example.com', '101 Pine Street', '2021-09-01', 4),
(5, 'Eve', 'White', '2003-12-25', 'Other', 'eve.white@example.com', '202 Birch Street', '2022-09-01', 5);

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

CREATE TABLE `userroles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userroles`
--

INSERT INTO `userroles` (`role_id`, `role_name`, `description`) VALUES
(1, 'Admin', 'System administrator with full access'),
(2, 'Lecturer', 'Lecturer with access to course and student management'),
(3, 'Student', 'Student with access to their own information'),
(4, 'Finance', 'Finance staff with access to fees information'),
(5, 'Registrar', 'Registrar staff with access to enrollment and records');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `role_id`, `created_at`) VALUES
(1, 'admin', 'password123', 'admin@example.com', 1, '2024-11-09 10:46:55'),
(2, 'jdoe', 'password123', 'john.doe@example.com', 2, '2024-11-09 10:46:55'),
(3, 'asmith', 'password123', 'alice.johnson@example.com', 3, '2024-11-09 10:46:55'),
(4, 'finance1', 'password123', 'finance1@example.com', 4, '2024-11-09 10:46:55'),
(5, 'registrar1', 'password123', 'registrar1@example.com', 5, '2024-11-09 10:46:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applicants`
--
ALTER TABLE `applicants`
  ADD PRIMARY KEY (`applicant_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `program_id` (`program_id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`education_id`),
  ADD KEY `applicant_id` (`applicant_id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`fee_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`lecturer_id`),
  ADD UNIQUE KEY `contact_info` (`contact_info`);

--
-- Indexes for table `professional_qualifications`
--
ALTER TABLE `professional_qualifications`
  ADD PRIMARY KEY (`qualification_id`),
  ADD KEY `applicant_id` (`applicant_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`program_id`);

--
-- Indexes for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`sponsor_id`),
  ADD KEY `applicant_id` (`applicant_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `contact_info` (`contact_info`),
  ADD KEY `program_id` (`program_id`);

--
-- Indexes for table `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applicants`
--
ALTER TABLE `applicants`
  MODIFY `applicant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `education_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `lecturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `professional_qualifications`
--
ALTER TABLE `professional_qualifications`
  MODIFY `qualification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `program_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `sponsor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `userroles`
--
ALTER TABLE `userroles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`) ON DELETE SET NULL;

--
-- Constraints for table `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `education_ibfk_1` FOREIGN KEY (`applicant_id`) REFERENCES `applicants` (`applicant_id`) ON DELETE CASCADE;

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE;

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE;

--
-- Constraints for table `professional_qualifications`
--
ALTER TABLE `professional_qualifications`
  ADD CONSTRAINT `professional_qualifications_ibfk_1` FOREIGN KEY (`applicant_id`) REFERENCES `applicants` (`applicant_id`) ON DELETE CASCADE;

--
-- Constraints for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD CONSTRAINT `sponsors_ibfk_1` FOREIGN KEY (`applicant_id`) REFERENCES `applicants` (`applicant_id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`) ON DELETE SET NULL;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `userroles` (`role_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

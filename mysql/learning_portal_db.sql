-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 24, 2018 at 02:47 PM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learning_portal_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorcourses`
--

DROP TABLE IF EXISTS `authorcourses`;
CREATE TABLE IF NOT EXISTS `authorcourses` (
  `idAuthorCourses` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `AuthorPriority` int(11) NOT NULL,
  `rowstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idAuthorCourses`),
  UNIQUE KEY `idUser` (`idUser`,`idCourse`),
  KEY `idCourse` (`idCourse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `idCategory` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(255) NOT NULL,
  `rowstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCategory`),
  UNIQUE KEY `CategoryName` (`CategoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coursehistory`
--

DROP TABLE IF EXISTS `coursehistory`;
CREATE TABLE IF NOT EXISTS `coursehistory` (
  `idCourseHistory` int(11) NOT NULL AUTO_INCREMENT,
  `idCourse` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `CompletionDate` date DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `RegistrationDate` date NOT NULL,
  `RewardedPoints` int(11) DEFAULT NULL,
  `rowstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCourseHistory`),
  UNIQUE KEY `idCourse` (`idCourse`,`Status`,`idUser`),
  KEY `idUser` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `idCourse` int(11) NOT NULL AUTO_INCREMENT,
  `CourseName` text NOT NULL,
  `ReleaseDate` date NOT NULL,
  `UpdatedOn` date DEFAULT NULL,
  `CourseDescription` longtext NOT NULL,
  `rowstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCourse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coursescategories`
--

DROP TABLE IF EXISTS `coursescategories`;
CREATE TABLE IF NOT EXISTS `coursescategories` (
  `idCoursesCategories` int(11) NOT NULL AUTO_INCREMENT,
  `idCourse` int(11) NOT NULL,
  `idCategory` int(11) NOT NULL,
  `rowstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCoursesCategories`),
  UNIQUE KEY `idCourse` (`idCourse`,`idCategory`),
  KEY `idCategory` (`idCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `course_comments`
--

DROP TABLE IF EXISTS `course_comments`;
CREATE TABLE IF NOT EXISTS `course_comments` (
  `idCourseComment` int(11) NOT NULL AUTO_INCREMENT,
  `CommentText` longtext NOT NULL,
  `idCourse` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `rowstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCourseComment`),
  KEY `idCourse` (`idCourse`),
  KEY `idUser` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `favourite_courses`
--

DROP TABLE IF EXISTS `favourite_courses`;
CREATE TABLE IF NOT EXISTS `favourite_courses` (
  `idFavouriteCourse` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `rowstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idFavouriteCourse`),
  UNIQUE KEY `idUser` (`idUser`,`idCourse`),
  KEY `idCourse` (`idCourse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prerequisites`
--

DROP TABLE IF EXISTS `prerequisites`;
CREATE TABLE IF NOT EXISTS `prerequisites` (
  `idPrerequisite` int(11) NOT NULL AUTO_INCREMENT,
  `idCourseRequested` int(11) NOT NULL,
  `idCourseNeeded` int(11) NOT NULL,
  `rowstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPrerequisite`),
  UNIQUE KEY `idCourseRequested` (`idCourseRequested`,`idCourseNeeded`),
  KEY `idCourseNeeded` (`idCourseNeeded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
CREATE TABLE IF NOT EXISTS `quiz` (
  `idQuiz` int(11) NOT NULL AUTO_INCREMENT,
  `idCourse` int(11) NOT NULL,
  `QuizName` text NOT NULL,
  `QuizContent` longtext NOT NULL,
  `TargetResult` int(11) NOT NULL,
  `rowstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idQuiz`),
  UNIQUE KEY `idCourse` (`idCourse`,`QuizName`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quizsession`
--

DROP TABLE IF EXISTS `quizsession`;
CREATE TABLE IF NOT EXISTS `quizsession` (
  `idQuizSession` int(11) NOT NULL AUTO_INCREMENT,
  `User_Results` int(11) DEFAULT NULL,
  `PassedStatus` varchar(255) NOT NULL,
  `StartDate` date NOT NULL,
  `CompletionDate` date DEFAULT NULL,
  `idQuiz` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `rowstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idQuizSession`),
  UNIQUE KEY `PassedStatus` (`PassedStatus`,`idQuiz`,`idUser`),
  KEY `idQuiz` (`idQuiz`),
  KEY `idUser` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `recommended_courses`
--

DROP TABLE IF EXISTS `recommended_courses`;
CREATE TABLE IF NOT EXISTS `recommended_courses` (
  `idRecommendedCourse` int(11) NOT NULL AUTO_INCREMENT,
  `idCourse` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `rowstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idRecommendedCourse`),
  UNIQUE KEY `idCourse` (`idCourse`,`idUser`),
  KEY `idUser` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `EmailAddress` varchar(255) NOT NULL,
  `PhoneNumber` int(11) DEFAULT NULL,
  `isAdmin` int(11) NOT NULL,
  `isContentPublisher` int(11) NOT NULL,
  `rowstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `EmailAddress` (`EmailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userstopics`
--

DROP TABLE IF EXISTS `userstopics`;
CREATE TABLE IF NOT EXISTS `userstopics` (
  `idUsersTopics` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idCategory` int(11) NOT NULL,
  `rowstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idUsersTopics`),
  UNIQUE KEY `idUser` (`idUser`,`idCategory`),
  KEY `idCategory` (`idCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authorcourses`
--
ALTER TABLE `authorcourses`
  ADD CONSTRAINT `authorcourses_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `authorcourses_ibfk_2` FOREIGN KEY (`idCourse`) REFERENCES `courses` (`idCourse`);

--
-- Constraints for table `coursehistory`
--
ALTER TABLE `coursehistory`
  ADD CONSTRAINT `coursehistory_ibfk_1` FOREIGN KEY (`idCourse`) REFERENCES `courses` (`idCourse`),
  ADD CONSTRAINT `coursehistory_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`);

--
-- Constraints for table `coursescategories`
--
ALTER TABLE `coursescategories`
  ADD CONSTRAINT `coursescategories_ibfk_1` FOREIGN KEY (`idCourse`) REFERENCES `courses` (`idCourse`),
  ADD CONSTRAINT `coursescategories_ibfk_2` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`idCategory`);

--
-- Constraints for table `course_comments`
--
ALTER TABLE `course_comments`
  ADD CONSTRAINT `course_comments_ibfk_1` FOREIGN KEY (`idCourse`) REFERENCES `courses` (`idCourse`),
  ADD CONSTRAINT `course_comments_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`);

--
-- Constraints for table `favourite_courses`
--
ALTER TABLE `favourite_courses`
  ADD CONSTRAINT `favourite_courses_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `favourite_courses_ibfk_2` FOREIGN KEY (`idCourse`) REFERENCES `courses` (`idCourse`);

--
-- Constraints for table `prerequisites`
--
ALTER TABLE `prerequisites`
  ADD CONSTRAINT `prerequisites_ibfk_1` FOREIGN KEY (`idCourseRequested`) REFERENCES `courses` (`idCourse`),
  ADD CONSTRAINT `prerequisites_ibfk_2` FOREIGN KEY (`idCourseNeeded`) REFERENCES `courses` (`idCourse`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`idCourse`) REFERENCES `courses` (`idCourse`);

--
-- Constraints for table `quizsession`
--
ALTER TABLE `quizsession`
  ADD CONSTRAINT `quizsession_ibfk_1` FOREIGN KEY (`idQuiz`) REFERENCES `quiz` (`idQuiz`),
  ADD CONSTRAINT `quizsession_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`);

--
-- Constraints for table `recommended_courses`
--
ALTER TABLE `recommended_courses`
  ADD CONSTRAINT `recommended_courses_ibfk_1` FOREIGN KEY (`idCourse`) REFERENCES `courses` (`idCourse`),
  ADD CONSTRAINT `recommended_courses_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`);

--
-- Constraints for table `userstopics`
--
ALTER TABLE `userstopics`
  ADD CONSTRAINT `userstopics_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`idUser`),
  ADD CONSTRAINT `userstopics_ibfk_2` FOREIGN KEY (`idCategory`) REFERENCES `categories` (`idCategory`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

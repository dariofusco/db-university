-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(id) AS `number_students`, YEAR(`enrolment_date`) AS `enrolment_year`
FROM `students`
GROUP BY YEAR(`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(id) AS `number_teachers`, `office_address`
FROM `teachers`
GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`exam_student`.`vote`) AS `avg_vote`, `exams`.`date` AS `exam_date`
FROM `exam_student`
INNER JOIN `exams`
ON `exams`.`id` = `exam_student`.`exam_id`
INNER JOIN `courses`
ON `courses`.`id` = `exams`.`course_id`
GROUP BY `exam_date`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(`degrees`.`id`) AS `number_degrees`, `departments`.`name` AS `department_name`
FROM `degrees` 
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
GROUP BY `departments`.`name`;
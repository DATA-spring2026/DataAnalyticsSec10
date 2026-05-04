# examples using Table Data Import Wizard and shared_expenses_example.csv

USE household;

DELETE FROM household.shared_expenses
WHERE Amount = "$180,169.94";

ALTER TABLE shared_expenses
MODIFY amount VARCHAR(10);

ALTER TABLE shared_expenses
DROP COLUMN Year;

ALTER TABLE shared_expenses
DROP COLUMN `Category Filter`;

ALTER TABLE shared_expenses
ADD COLUMN ExpenseID INT PRIMARY KEY AUTO_INCREMENT FIRST;
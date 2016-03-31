# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)

  CREATE VIEW chem_yrs AS
    SELECT
      yr
    FROM
      nobels
    WHERE
        subject = 'Chemistry';

  SELECT DISTINCT
    yr
  FROM
   nobels
  WHERE
    subject = 'Physics' AND
    yr NOT IN (
      SELECT
            yr
          FROM
            nobels
          WHERE
            subject = 'Chemistry'
          )

  SQL
end

# mysql> CREATE VIEW employee_vw AS
#
#  -> SELECT emp_id, fname, lname,
#
#  -> YEAR(start_date) start_year
#
#  -> FROM employee;

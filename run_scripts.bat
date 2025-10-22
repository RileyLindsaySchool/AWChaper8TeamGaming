@echo off

set sql_file=create_db.sql
set PASSWORD=%1%
mysql -u root -p%PASSWORD% aw_sim < %sql_file%
IF %ERRORLEVEL% NEQ 0 (
    echo Error: create_tables.sql failed! Exiting.
    EXIT /B %ERRORLEVEL%
)

set sql_file=create_tables.sql
mysql -u root -p%PASSWORD% aw_sim < %sql_file%
IF %ERRORLEVEL% NEQ 0 (
    echo Error: %sql_file% failed! Exiting.
    EXIT /B %ERRORLEVEL%
)

set sql_file=technicians_and_customers.sql
mysql -u root -p%PASSWORD% aw_sim < %sql_file%
IF %ERRORLEVEL% NEQ 0 (
    echo Error: %sql_file% failed! Exiting.
    EXIT /B %ERRORLEVEL%
)

set sql_file=items.sql
mysql -u root -p%PASSWORD% aw_sim < %sql_file%
IF %ERRORLEVEL% NEQ 0 (
    echo Error: %sql_file% failed! Exiting.
    EXIT /B %ERRORLEVEL%
)

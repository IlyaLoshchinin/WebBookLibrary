@ECHO OFF
setlocal
set CURR=%cd%
echo %CURR%
set CATALINA_HOME="D:\Programs\IntelliJ IDEA 2016.2.4\apache-tomcat-8.5.15\apache-tomcat-8.5.15" 
echo Path to Tomcat: %CATALINA_HOME%
cd %CATALINA_HOME%\bin
echo Close Tomcat and DerbyDb - if active
pause
call shutdown.sh
cd %CURR%
CD .\database
call derby stop
echo Copy the war_exploded to webapps in Tomcat.
pause
xcopy /s /y ..\out\artifacts\WebBookLibr_war_exploded %CATALINA_HOME%\webapps\ROOT
echo Run DerbyDB and Tomcat and then open a browser.
pause
cd %CATALINA_HOME%\bin
call startup.sh 
cd %CURR%
CD .\database
start HTTP://localhost:8080/
call derby start

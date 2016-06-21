# Logman
## Manages your logs!


<img src="https://github.com/aussiearef/Logman/blob/master/src/Logman.Web/Content/Images/LogManLogo.jpg" />

Logman is an **ASP.NET** application which receives application logs through some REST APIs, and then lets the end users see and analyse them through lists and chart.

This is very useful when you or your company want to have a centralized repository of your application logs (Erros, Infos etc) to have visibility on your applications in a production environment. With Logman you will not have to use a third-party on-cloud service which have down sides such as network dependency (no Internet = no logs) and exposes your sensitive debug information to them.

This code also can be used for learning purposes. I've used some patterns (e.g. Unit Of Work, Repository, IOC etc) as well as Google Charts. 

> This project is a work-in-progress. It's 80% done and will be ready for use with some improvements.

### Roadmap:

What is needed to complete this project is:

- Complete the UI code
- Add unit tests
- Use some dependencies by using IOC (e.g. in SQLServer DataAccess Layer class)
- Fix namings. Some namings are not correct (e.g. the SQL Server data access layer is in a folder called Facade!)
- Add NLog target 



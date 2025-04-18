<!-- Reqularly checking the repo so need to schedule the job in jenkins it self -->
# Poll SCM
- go to jenkins and check Poll SCM option
- add the schedulers in for mat MIN HOUR DATE_OF_MONTH(1-31) MONTH(1-12) DASY_OF_WEEK(1-7) in inline format (ex: * * * * * -> it will run every min) 
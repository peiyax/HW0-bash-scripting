Last login: Tue Oct 13 10:16:15 on ttys001 (base) itskir@Peiyans-MacBook-Pro ~ % history
(base) itskir@Peiyans-MacBook-Pro ~ % cd cse583 
(base) itskir@Peiyans-MacBook-Pro cse583 % cd pronto
(base) itskir@Peiyans-MacBook-Pro pronto % mkdir data
(base) itskir@Peiyans-MacBook-Pro pronto % cd data
(base) itskir@Peiyans-MacBook-Pro cse583 % cd pronto 
(base) itskir@Peiyans-MacBook-Pro pronto % nano README.txt 
(base) itskir@Peiyans-MacBook-Pro pronto % curl -O https://s3.amazonaws.com/pronto-data/open_data_year_one.zip
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 70.8M  100 70.8M    0     0  14.6M      0  0:00:04  0:00:04 --:--:-- 15.7M
(base) itskir@Peiyans-MacBook-Pro pronto % cd data    
(base) itskir@Peiyans-MacBook-Pro data % unzip open_data_year_one.zip 
Archive:  open_data_year_one.zip
  inflating: 2015_station_data.csv   
  inflating: 2015_status_data.csv    
  inflating: 2015_trip_data.csv      
  inflating: 2015_weather_data.csv   
  inflating: README.txt              
(base) itskir@Peiyans-MacBook-Pro data % ls
2015_station_data.csv	2015_trip_data.csv	open_data_year_one.zip
2015_status_data.csv	2015_weather_data.csv	README.txt
(base) itskir@Peiyans-MacBook-Pro data % head *.csv
==> 2015_station_data.csv <==
id,name,terminal,lat,long,dockcount,online
1,3rd Ave & Broad St,BT-01,47.618418,-122.350964,18,10/13/2014
2,2nd Ave & Vine St,BT-03,47.615829,-122.348564,16,10/13/2014
3,6th Ave & Blanchard St,BT-04,47.616094,-122.341102,16,10/13/2014
4,2nd Ave & Blanchard St,BT-05,47.61311,-122.344208,14,10/13/2014
5,2nd Ave & Pine St,CBD-13,47.610185,-122.339641,18,10/13/2014
6,7th Ave & Union St,CBD-03,47.610731,-122.332447,20,10/13/2014
7,City Hall / 4th Ave & James St,CBD-07,47.603509,-122.330409,18,10/13/2014
8,Pine St & 9th Ave,SLU-16,47.613715,-122.331777,20,10/13/2014
9,2nd Ave & Spring St,CBD-06,47.60595,-122.335768,20,10/13/2014

==> 2015_status_data.csv <==
station_id,bikes_available,docks_available,bikes_blocked,docks_blocked,time
1,0,16,2,0,"2014-10-15 08:29:47"
2,4,12,0,0,"2014-10-15 08:29:47"
3,7,8,1,0,"2014-10-15 08:29:47"
4,3,11,0,0,"2014-10-15 08:29:47"
5,7,10,1,0,"2014-10-15 08:29:47"
6,14,0,3,0,"2014-10-15 08:29:47"
7,9,11,0,0,"2014-10-15 08:29:47"
8,9,9,2,0,"2014-10-15 08:29:47"
9,8,11,1,0,"2014-10-15 08:29:47"

==> 2015_trip_data.csv <==
trip_id,starttime,stoptime,bikeid,tripduration,from_station_name,to_station_name,from_station_id,to_station_id,usertype,gender,birthyear
431,10/13/2014 10:31,10/13/2014 10:48,SEA00298,985.935,2nd Ave & Spring St,Occidental Park / Occidental Ave S & S Washington St,CBD-06,PS-04,Annual Member,Male,1960
432,10/13/2014 10:32,10/13/2014 10:48,SEA00195,926.375,2nd Ave & Spring St,Occidental Park / Occidental Ave S & S Washington St,CBD-06,PS-04,Annual Member,Male,1970
433,10/13/2014 10:33,10/13/2014 10:48,SEA00486,883.831,2nd Ave & Spring St,Occidental Park / Occidental Ave S & S Washington St,CBD-06,PS-04,Annual Member,Female,1988
434,10/13/2014 10:34,10/13/2014 10:48,SEA00333,865.937,2nd Ave & Spring St,Occidental Park / Occidental Ave S & S Washington St,CBD-06,PS-04,Annual Member,Female,1977
435,10/13/2014 10:34,10/13/2014 10:49,SEA00202,923.923,2nd Ave & Spring St,Occidental Park / Occidental Ave S & S Washington St,CBD-06,PS-04,Annual Member,Male,1971
436,10/13/2014 10:34,10/13/2014 10:47,SEA00337,808.805,2nd Ave & Spring St,Occidental Park / Occidental Ave S & S Washington St,CBD-06,PS-04,Annual Member,Male,1974
437,10/13/2014 11:35,10/13/2014 11:45,SEA00202,596.715,Occidental Park / Occidental Ave S & S Washington St,King Street Station Plaza / 2nd Ave Extension S & S Jackson St,PS-04,PS-05,Annual Member,Male,1978
438,10/13/2014 11:35,10/13/2014 11:45,SEA00311,592.131,Occidental Park / Occidental Ave S & S Washington St,King Street Station Plaza / 2nd Ave Extension S & S Jackson St,PS-04,PS-05,Annual Member,Male,1983
439,10/13/2014 11:35,10/13/2014 11:45,SEA00486,586.347,Occidental Park / Occidental Ave S & S Washington St,King Street Station Plaza / 2nd Ave Extension S & S Jackson St,PS-04,PS-05,Annual Member,Female,1974

==> 2015_weather_data.csv <==
Date,Max_Temperature_F,Mean_Temperature_F,Min_TemperatureF,Max_Dew_Point_F,MeanDew_Point_F,Min_Dewpoint_F,Max_Humidity,Mean_Humidity ,Min_Humidity ,Max_Sea_Level_Pressure_In ,Mean_Sea_Level_Pressure_In ,Min_Sea_Level_Pressure_In ,Max_Visibility_Miles ,Mean_Visibility_Miles ,Min_Visibility_Miles ,Max_Wind_Speed_MPH ,Mean_Wind_Speed_MPH ,Max_Gust_Speed_MPH,Precipitation_In ,Events
10/13/2014,71,62,54,55,51,46,87,68,46,30.03,29.79,29.65,10,10,4,13,4,21,0,Rain
10/14/2014,63,59,55,52,51,50,88,78,63,29.84,29.75,29.54,10,9,3,10,5,17,0.11,Rain
10/15/2014,62,58,54,53,50,46,87,77,67,29.98,29.71,29.51,10,9,3,18,7,25,0.45,Rain
10/16/2014,71,61,52,49,46,42,83,61,36,30.03,29.95,29.81,10,10,10,9,4,-,0,Rain
10/17/2014,64,60,57,55,51,41,87,72,46,29.83,29.78,29.73,10,10,6,8,3,-,0.14,Rain
10/18/2014,68,64,59,59,57,55,90,83,68,29.96,29.9,29.8,10,8,2,10,4,-,0.31,Rain
10/19/2014,73,64,55,57,55,53,94,74,52,29.8,29.73,29.67,10,10,6,10,3,18,0,
10/20/2014,66,60,55,57,54,50,90,78,67,29.8,29.74,29.69,10,10,5,12,5,-,0.44,Rain
10/21/2014,64,58,55,52,49,46,87,70,58,29.93,29.85,29.74,10,10,6,15,8,21,0.1,Rain
(base) itskir@Peiyans-MacBook-Pro data % cd ..
(base) itskir@Peiyans-MacBook-Pro pronto % nano download_pronto.bash


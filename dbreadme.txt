DATEDATE
DOT Fatality Analysis Reporting System (FARS) YEARYEAR
README
Record Count (for main table `accident`): XXXXX1

This is the Fatality Analysis Reporting System (FARS) data (also called Fatal Accidents Reporting System) from the U.S. Department of Transportation. The data track automobile accidents on public U.S. roads that have resulted in the death of one or more persons within 30 days of the accident.  Truck and trailer accidents are included.

The data files cover 1975 - when the DOT first began tracking fatal accidents - through YEARYEAR. 
NICAR merged the 1994 through 2009 data together, but The DOT instituted major changes to the data in 2010, so data from 2010 going forward is separate. Data prior to 1994 are also kept in separate files.

BECAUSE THE DATA ARE SOMEWHAT COMPLEX, WE STRONGLY RECOMMEND THAT YOU AT LEAST SPOT-CHECK YOUR DATA RESULTS. ONE WAY TO DO THAT IS TO QUERY THE WEB-BASED INTERFACE AT http://www-fars.nhtsa.dot.gov/. THROUGH THAT SITE, YOU CAN EXAMINE DOT REPRESENTATIONS OF THE ACTUAL FORMS USED TO REPORT THE ACCIDENTS.

ABOUT LATITUDES AND LONGITUDES:  In 1999, the DOT added latitude and longitude fields to the first table and race and Hispanic on the table regarding people; however, few were actually filled in, thus making this field not terribly useful at that time. Then, starting in 2001, the DOT refused to provide the latitude and longitude information, citing privacy converns; however, in 2007, the agency reversed its decision and released such values in the 2005 and 2006 data. In the vast majority of cases, the fields are populated. In 2005, only 1,433 do not include latitude and longitudes; in 2006, the number is 2,019. The agency might re-release previous years data with those values as well.

The latest FARS database (YEARYEAR) consists of seventeen relational tables:

Accident (XXXXX1) -- contains information about crash characteristics and environmental conditions at the time of the crash. One record per crash.
Person (XXXXX2) -- contains information describing all persons involved in the crash, including motorists and non-motorists (bicyclists, pedestrians). Provides info such as age, sex, injury severity. One record per person. 
Vehicle (XXXXX3) -- contains information describing the in-transport motor vehicles and drivers involved. There is one record per vehicle. Parked and working vehicle info is in the Parkwork table.
Cevent (XXXXX4) -- contains information for all qualifying events which occurred in the crash. Details the chronological sequence of events. One record per event.
Distract (XXXXX5) -- contains information about driver distractions. At least one record per in-transport vehicle, each distraction is a separate record.
Drimpair (XXXXX6) -- contains information about physical impairments of drivers. There is one record per impairment, and at least one record for each driver.
Factor (XXXXX7) -- contains information about vehicle circumstances which may have contributed to the crash. At least one record per vehicle.
Maneuver (XXXXX8) -- contains information about actions taken by the driver to avoid something or someone in the road. At least one record per vhicle.
Nmcrash (XXXXX9) -- contains information about any improper actions of people who are not vehicle occupants or contributing circumstances noted on the accident report. At least one record per non-motorist.  
Nmimpair (XXXXX10) -- contains information about physical impairments of people who are not occupants of motor vehicles. At least one record per person who is a non-motorist.
Nmprior (XXXXX11) -- contains information about what non-motorists are doing prior to the crash. At least one record per non-motorist.
Parkwork (XXXXX12) -- contains information about parked and working vehicles involved in crashes. 
Safetyeq (XXXXX13) -- contains information about safety equipment used by people who are not occupants of motor vehicles. At least one record for each person who is not an occupant. 
Vevent (XXXXX14) -- contains information about the sequence of events for each motor vehicle involved in the crash. Includes non-harmful events, objects struck and areas of impact. One record for each event. 
Violatn (XXXXX15) -- contains information about violations which were charged to drivers. At least one record per in-transit motor vehicle. 
Vision (XXXXX16) -- contains information about circumstances which may have obscured the driver's vision. At least one record per in-transport motor vehicle.
Vsoe (XXXXX17) -- this is a simplified Vevent table.

Lookup tables: 
fips.csv -- fips codes for state, county, place
city_codes.csv -- contains city names (you must join on state, city and county code fields to get the correct city name)
cnty_codes.csv -- contains county names (you must join on state and county code fields to get the correct county name)

Other documents included: 
2010_fields_changed.xls -- a list of all the fields from 1994-2009 data that no longer exist, or have been converted to new fields in the 2010 data. 
FARS_layouts.xls -- record layouts for each of the seventeen tables in 2010 - YEARYEAR data.
FARS Analytic Users Manual.pdf -- a detailed guide to all the data contained in the various tables, and how the data have changed since 1975. 
2010_FARS_Coding_Manual.pdf
ANSI_Classification_Manual.pdf
FARS_Criteria.pdf

The 1994-2009 FARS database consists of three relational tables -- "ACCIDENT," the "VEHICLE" and the "PERSON." See the Readme.txt from the 1994-2009 dataset for more information. 

A few issues with data (including some 2008, 2009 updates):

- The field HAZ_CARG has now been replaced by five fields that offer more detail: HAZ_INV, HAZ_PLAC, HAZ_ID, HAZ_CNO and HAZ_REL.  Be careful when trying to determine the involvement of hazardous materials based on the HAZ_CARG field.  For some recent data, this field contains “0”s, which in the past indicated that no hazardous materials were involved.  Some of these records, however, have information in the five new fields indicating that hazardous materials were involved.  Thus, HAZ_CARG is not a reliable indication of the involvement of hazardous materials for the newest data.
- The field MCARR_ID is now a combination of two new fields: MCARR_I1 (a two-digit code for authority that issued the motor carrier ID) and MCARR_I2 (a nine-digit identification number for the motor carrier ID).
- VE_FORMS and VE_TOTAL: The field VE_FORMS appears in all three tables (person, vehicle and accident), and it represents the number of vehicles in transport involved in the crash.  The field VE_TOTAL appears only in the accident table and represents all the vehicles involved in the crash, including parked cars.  Thus, in some cases, the two fields are identical, and in others, the value in VE_TOTAL is higher.  VE_TOTAL is used only for data after 2005.
- The 2008 data for hit-and-runs (hit_run) in the accident and vehicle tables now contains fewer codes (and less detail) than previous years' data.  This is an example of the sort of changes in coding that occur from year to year.  It is necessary to use the system for the year in which the data was recorded because the same code may represent different things in different years.

A few notes about fields with problems, mainly because of the changes in codes:

MAN_COLL :  Manner of Collision -  Due to an expansion from one-digit data to two-digit data for 2001, many numbers appear twice with different meanings.  Also, don't assume that the DOT simply added a "0" to a "1".  For exmple, "6" and "06" are not the same thing. 

V_CONFIG :  Vehicle Configuration changed substantially over time. Bus, especially, is listed numerically as both 7 and 8 for about 2,000 records. The codes were expanded in 2001, so for that year and 2002, buses are coded as 20 or 21 (depending on number of passengers). Other types of vehicles have seen those changes, too.

PREV_SUS :  Previous number of suspensions -  There are many records above five (one person, supposedly, had his license suspended 77 times). The accompanying DOT literature says to question all records that list more than five. Treat all the other fields related to previous infractions the same way.

HIT_RUN  :  Fields don't correspond well to the documentation. Every option but 0 and 5 translated from the original code to mutliple text descriptions.

CF3_T is a bit dirty; the text descriptions of different codes overlap, but are similar.

PER_TYPE : was changed from 1 digit to a 2 digit coding system, but the text remains the same.

AIR_BAG  :  It doubles up on 00 - one is "not-applicable" the other is "non-motorist"

ATST_TYP : A few oddities.  They are, in brief; 10 in the coded form appears as "10" in the text field most of the time, but not all.  9 has multiple text meanings.  Code 99 is in the date, but not in the documentation.

RACE : 00 appears as either NOT A FATAL(N/A) or NOT A FATALITY

HISPANIC : 00 appears as either NOT A FATAL(N/A) or NOT A FATALITY or NOT APPLICABLE

HARM_EV :  There are several typos in this field.  Too many to explain, so run a "count" query on this field (and the corresponding HARM_EV_T) to see what's happening.

L_TYPE :  Several codes appear twice, and with significantly different text descriptions.

If you're interested in examining alcohol-related accidents, we suggest you use the field dr_drink in the vehicle table, rather than the field drunk_dr in the accident table. Despite the fact that DOT documentation says the field drunk_dr field counts the number of drunk drivers, it appears to be counting drunk drivers AND passengers, at least in some instances. On the other hand, the field called dr_drink (also dr_drink_t) in the vehicle table shows only driver information.

The city and county codes are Geographic Location Codes. These codes, maintained by the General Services Administration, list the number and letter codes federal agencies should use in designating geographic locations anywhere in the United States or abroad. 

In order to do an appropriate join between the Accident level city and county fields and the lookup tables (codes.csv in the "lookup" folder) you must join on both the state code (state = stcode) AND the matching codes for the location (i.e., county=cnty_code or city = city_code).

Finally, note that you can't simply join all of the tables together in Access and most database managers because of the limitation of the number of fields, most commonly 255. Joining every field in the tables would result in more than 255 fields.

In the older data tables:

Level one ("ACCIDENT LEVEL") table includes information that describes the accidents themselves, including road conditions, weather conditions, speed limits, number of vehicles, persons involved, etc. There is one record for every accident in this table.

Level two ("VEHICLE LEVEL") table contains information about the vehicles' make and model, Vehicle Identification Numbers, registered states, registered owners, etc. There is one record for every vehicle involved in this table.

Level three ("DRIVER LEVEL") table includes driver information like state that issued the driver's license, previous speeding and DUI convictions, involvement in previous accidents and more. New in 1998 are the driver height and weight. There is one record for each driver in this table.

Level four ("PERSON LEVEL") table deals with information about those who died in or survived the fatal accidents, including age, sex, position in the vehicle, whether or not a restraint system was engaged, whether airbag was deployed, etc. There is one record for every person (includes both motorists and non-motorists, injured and non-injured) involved in the accident. (There are usually more records in this table than the others.)

More information about FARS is available on the DOT Web site at http://www.nhtsa.dot.gov/people/ncsa/fars.html

DOT contacts for questions regarding FARS:
Dennis M. Flemons, (202) 366-5389, FARS Training Program
Barry D. Eisemann, (202) 366-5367, FARS Data Processing

If you have any questions about NICAR Processing, please contact NICAR at (573) 884-7711.

FROM THE IRE RESOURCE CENTER:
Stories

#21321
A special report from the Orlando Sentinel looks at the number of fatal accidents in the lesser traveled highways in Florida. Deliberating on fatal accidents on the Colonial Drive in Central Florida, the in-depth report reveals that even though the traffic on the highways has lessened, the rate of accidents remains high.

#21020
The Gazette investigation found that nearly half the fatal accidents on Interstate 80 in Iowa from 1994-2001 involved semi-trailer trucks. No other interstate in Iowa had a rate that high. Traffic counts are growing on a 60-70 mile stretch of I-80 in Eastern Iowa, where many of the semi-trailer trucks are concentrated.
 
#18888
A KSTP-TV Eyewitness news investigation found a serious design flaw in the Jeep brand automobiles. In low-speed, rear-impact collisions, passenger doors have tended to jam and the gas tank tears loose, emptying into the passenger compartment.
 
#18812
The Kansas City Star reports on the effects of deregulation on the trucking industry. As truckers work long hours for low pay, the result is disturbing: "Fatigue behind the wheel of 40-ton rigs is now so pervasive on American highways that drivers regularly nod off and drift into oncoming lanes or slam into the backs of slower-moving cars.
 
#17551
Dateline investigated "one of this year's most controversial auto safety issues, revealing vital new information about the risk of deadly rollover accidents in sport utility vehicles.
 
#16864
An analysis by the Washington Post reveals that the "Ford Explorer has a higher rate of tire-related accidents than other sport-utility vehicles," regardless of the tire brand. The findings suggest that there is something about the design of the Explorer that contributes to accidents. This may mean that Firestone Tires are not entirely to blame for the recent fatal accidents.

#16809
The Star-Telegram investigates the dangers of driving on Texas highways and interstates. A recent survey showed that several of Fort Worth's heavily traveled highways have a high total of accidents and fatal car wrecks.
 
#22600
The story investigated the disproportionately high number of auto fatalities and injuries caused by Hispanic drivers, most of them seasonal migrant workers, on Virginia's East Shore. Most of the accidents were alcohol related.
  
Tipsheets

#2420
This tipsheet is a comprehensive guide to reporting on the trucking industry. It begins with a list of questions to ask at the beginning of an investigation, like, "Did the truck driver have a valid Commercial Drivers License?" Next, the tipsheet lists some pieces of information that reporters should be able to find before deadline that could make their stories better.
 
#2492
Tom McGinty gives information on how to use the National Highway Traffic Safety Administration's Fatal Accident Reporting System, or FARS. He covers why it exists, how comprehensive and accurate the data is, and how it is structured.
 
#2376
This tipsheet is a basic overview of what resources to use when reporting on traffic fatalities. Tom McGinty offers some background on FARS, paper documents and driving records, and then explains how all three can all be helpful when reporting on the topic.
 
#2981
Brad Branan explores the value of pursuing a story on drunk driving, including what databases are helpful in such an investigation, and how to verify and analyze the information.

Most tipsheets are downloadable for IRE members from http://www.ire.org/resourcenter. To obtain copies of stories, contact the Resource Center at (573) 882-3364.




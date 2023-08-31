COVID-19 Statistics Data App
==================

This application is a simple GUI program developed in the MATLAB enviroment, capable of calculate and display statistic information about COVID-19 cases and deaths across the world and many countries and states. 

---

## How to Compile and Run the Software

The program was developed in the MATLAB 2021.a and works with this and newer versions. The app comes pre-compiled and runs into te MATLAB enviroment with no more requirements needed. An executable version or an installer for Windows or Mac can be generated though the MATLAB tools and to run this standalone version the requirement would be to have only the MATLAB runtime installed.

### The Input Data Format

The data source used is provided by the Johns Hopkins University and the input data format must follow the pattern of line: [country, state, dd/mm/yy, dd/mm/yy, ...] just like the covid_data.mat file.

### The Output Information

As visualized in the image below, the application can display for the hole world or per country/state:

- Total cases 
- Deaths
- Cumulative data
- Daily with regulable averaging

---

<img src="https://github.com/rodrigojost/covidStatisticsApp/blob/master/assets/appGUI.png">




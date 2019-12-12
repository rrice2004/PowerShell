# PowerShell--EventLog-Search
Powershell script to search through Windows eventlogs

Ability to search through event logs by ID, error level, name provider and keywords. Able to search multiple ID's and multiple error levels. 

## Usage
Run the powershell script. Fill out the information and get a grid view export

    Enter Computer or EXIT to quit: 
    Enter log set to retrieve: 
    Enter Instance ID or leave blank: 
    Enter number of logs to retrieve: 
    Enter error level or leave blank: 
    Search logs by keyword or leave blank: 
    Search by Provider or leave blank: 
    
Example (Search by multiple ID's):

    Enter Computer or EXIT to quit: office
    Enter log set to retrieve: application
    Enter Instance ID or leave blank: 258,10001
    Enter number of logs to retrieve: 15
    Enter error level or leave blank: 
    Search logs by keyword or leave blank: 
    Search by Provider or leave blank: 
    
Results:
![alt text](https://github.com/rrice2004/PowerShell--EventLog-Search/blob/master/Example1.PNG)


Example (Search by keyword):

    Enter Computer or EXIT to quit: office
    Enter log set to retrieve: application
    Enter Instance ID or leave blank: 
    Enter number of logs to retrieve: 10
    Enter error level or leave blank: 
    Search logs by keyword or leave blank: plex
    Search by Provider or leave blank: 
    
Results:
![alt text](https://github.com/rrice2004/PowerShell--EventLog-Search/blob/master/Example2.PNG)




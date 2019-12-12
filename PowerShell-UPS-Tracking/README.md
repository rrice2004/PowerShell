# PowerShell UPS Tracking
PowerShell script to validate supplied UPS tracking number.

### Prerequisites

PowerShell



### Examples

Will return Valid if UPS has not picked up the package yet.
Returns Invalid if number has been used, is in transit, has been delivered, or has invalid characters.

Enter Tracking Number: : 1Z3W469V0294547632
Valid

Enter Tracking Number: : 1Z3W469V0294547633
Invalid


## Deployment

Run ps1 from PowerShell IDE or PowerShell command line. 
Can be instergrated into Service Manager/Orchestrator for runbooks.


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


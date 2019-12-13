# PowerShell---Get Installed Updates
Dirty, but simple PowerShell script to get installed Windows updates from a computer and output the results to a filterable grid.

## Usage
Run the powershell script. Enter the computer name. If the computer is online, it will search for installed updates. If it's not online, you will be advised.

```
Enter Computer name, or EXIT to quit: Computer1
[ INFO ]:  Getting Installed Updates for Computer1
[ INFO ]:  Checking if machine is online.
[ Alert ]: Machine is online...continuing.
[ INFO ]: See Output Grid for results.

Enter Computer name, or EXIT to quit: 



Enter Computer name, or EXIT to quit:  Computer2

[ INFO ]:  Getting Installed Updates for  Computer2
[ INFO ]:  Checking if machine is online.
[ ERROR ]:  Computer2 is not online.

Enter Computer name, or EXIT to quit: 

```



## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

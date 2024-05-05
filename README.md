# ASP.NET Project

## Description
This is a Student service ASP.NET project demonstrating CRUD operations with a SQL Server database.

## Setup
1. Clone the repository to your local machine.
   ```sh
   git clone https://github.com/ahmad-1366/SE-Project.git
   
2. Open the solution file (Website1.sln) in Visual Studio. <br>
3. Modify the Web.config file to include your SQL Server connection string.<br>
Replace ConnectionString with your SQL Server connection string.
```sh
<connectionStrings>
    <add name="Database" connectionString="Data Source=YourServer;Initial Catalog=YourDatabase;User ID=YourUsername;Password=YourPassword;" providerName="System.Data.SqlClient" />
</connectionStrings>
```
<br>
Build and run the project in Visual Studio.<br>

### Usage<br>
Navigate to the project in your web browser to access the application.<br>
Use the application to perform CRUD operations on the database.<br>
### Contributing<br>
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.<br>

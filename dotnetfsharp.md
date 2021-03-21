# DotNet code organization

The .Net ecosystem comes with a nice set of tools to organize and build the codebase for applications. 
This approach is different from C/C++ universe where Make (or some similar) build system is
used to describe layout, dependencies and build directives of the codebase.
The build system in .NET is centered around the  concept of solution, templates, libraries and apps. 
To build an application, we first create a solution, add libraries to these,
and finally describe dependencies of  applications to the libraries. 

A rundown of the relevant commands (more details here [1])

### Create solution
```
dotnet new sln -o MySolution
```

This will create MySolution directory with MySolution.sln file. 

### Create libraries
Execute
```
cd MySolution  
dotnet new classlib -lang "F#" -o src/MyLibraryA
dotnet new classlib -lang "F#" -o src/MyLibraryB
```
to create placeholders for two of the libraries mentioned.
For a  library, X, dotnet creates a folder X along with "X.fs" and "X.fsproj" files.
The content of library X goes into module X described in X.fs.

External dependenices to library can be added as follows:
```
dotnet add src/Library/MyLibraryA.fsproj package ExtLib.Json
```
This adds dependency on ExtLib for MyLibraryA. 

The next step is to make the libraries part of the solution using commands:
```
dotnet sln add src/Library/MyLibraryA.fsproj
dotnet sln add src/Library/MyLibraryB.fsproj
```

### Create application
The final part is writing application build using the above libraries.
First, setup the application 
```
dotnet new console -lang "F#" -o src/MyApp
```
Next, create links (or reference) to the libraries
```
dotnet add src/MyApp/MyApp.fsproj reference src/Library/MyLibraryA.fsproj
dotnet add src/MyApp/MyApp.fsproj reference src/Library/MyLibraryB.fsproj
```
Finally, add the app to the solution:
```
dotnet sln add src/MyApp/MyApp.fsproj
```
To build the solution/project run:
```
dotnet restore
dotnet build
```

To run the MyApp
```
cd src/MyApp
dotnet run <myapp-args
```



# Related Topics
1. Templates



[1] https://docs.microsoft.com/en-us/dotnet/fsharp/get-started/get-started-command-line
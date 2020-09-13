# DotNet code organization

.Net ecosystem comes with nice tools out of the box to organize your codebase. This seems different from C/C++ world where Makefile (or some similar) build system is used to describe layout and dependencies of your code.
To begin with .Net uses the concept of solution, libraries and apps. 
We first create a solution, add libraries, and finally build applications using the libraries.

A rundown of the relevant commands (more details here [1])

### Create solution
```
dotnet new sln -o MySolution
```

This will create MySolution directory with MySolution.sln file. 

### Create libraries
Switch to MySolution directory and execute:
```
dotnet new classlib -lang "F#" -o src/MyLibraryA
dotnet new classlib -lang "F#" -o src/MyLibraryB
```

For each library, X, dotnet creates a folder X along with "X.fs" and "X.fsproj" files.
Put the content of library X in module X described in X.fs. To add external dependency
to the library
```
dotnet add src/Library/MyLibraryA.fsproj package ExtLibDependency.Json
```

Add the libraries to the solution
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

[1] https://docs.microsoft.com/en-us/dotnet/fsharp/get-started/get-started-command-line
How to run invoke-ASCmd in simple http trigger function powershell runtime V 1~:

it's a workaround to change runtime to 1.x and can import SqlServer modue with invoke-ASCmd which PowerShell version is 5.x that is what I needed :)

Step 1 : Create azure function with v1 runtime There is no way to directly create a V1 functions since version V2 with Powershell support is in public preview. you need to create an empty V2 function and 'downgrade' it through the portal to V1 (as shown in the screenshot below) https://github.com/martinagrom/Office365Scripts/issues/2

Step 2 : add modules SqlServer to a function it's simple on read this article: https://rasper87.wordpress.com/2019/01/25/import-powershell-module-package-into-azure-function/ which tells you how to add modules to a function. list files : /HttpTrigger1/modules/SqlServer.psd1 /HttpTrigger1/modules/Microsoft.AnalysisServices.Core.dll /HttpTrigger1/modules/Microsoft.AnalysisServices.dll /HttpTrigger1/modules/Microsoft.AnalysisServices.PowerShell.Cmdlets.dll /HttpTrigger1/modules/Microsoft.AnalysisServices.PowerShell.Provider.dll /HttpTrigger1/modules/Microsoft.AnalysisServices.Tabular.dll /HttpTrigger1/modules/Microsoft.SqlServer.ConnectionInfo.dll /HttpTrigger1/modules/Microsoft.SqlServer.Management.PSProvider.dll /HttpTrigger1/modules/Microsoft.SqlServer.Management.Sdk.Sfc.dll /HttpTrigger1/modules/sqlnotebook.psm1 /HttpTrigger1/modules/SqlServer.psm1

Step 3 : use script on Run.ps1

Step 4 : Enjoy :)

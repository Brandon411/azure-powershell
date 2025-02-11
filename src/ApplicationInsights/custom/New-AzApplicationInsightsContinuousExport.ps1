# ----------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Code generated by Microsoft (R) AutoRest Code Generator.Changes may cause incorrect behavior and will be lost if the code
# is regenerated.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Create a Continuous Export configuration of an Application Insights component.
.Description
Create a Continuous Export configuration of an Application Insights component.
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Models.Api20150501.IApplicationInsightsComponentExportConfiguration
.Link
https://docs.microsoft.com/powershell/module/az.applicationinsights/new-azapplicationinsightscontinuousexport
#>
function New-AzApplicationInsightsContinuousExport {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Models.Api20150501.IApplicationInsightsComponentExportConfiguration])]
    [CmdletBinding(DefaultParameterSetName='CreateExpanded', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Category('Path')]
        [System.String]
        # The name of the resource group.
        # The name is case insensitive.
        ${ResourceGroupName},
    
        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Category('Path')]
        [Alias("ApplicationInsightsComponentName", "ComponentName")]
        [System.String]
        # The name of the Application Insights component resource.
        ${Name},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
        [System.String]
        # The ID of the target subscription.
        ${SubscriptionId},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Category('Body')]
        [System.String]
        # The Continuous Export destination type.
        # This has to be 'Blob'.
        ${DestinationType},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Category('Body')]
        [System.String]
        # Deprecated
        ${NotificationQueueEnabled},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Category('Body')]
        [System.String]
        # Deprecated
        ${NotificationQueueUri},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Category('Body')]
        [System.String[]]
        # The document types to be exported, as comma separated values.
        # Allowed values include 'Requests', 'Custom Event', 'Exception', 'Metric', 'Page View', 'Page Load', 'Dependency', 'Performance Counter', 'Availability', 'Trace'.
        ${DocumentType},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Category('Body')]
        [System.String]
        # The name of destination storage account.
        ${StorageAccountId},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Category('Body')]
        [System.String]
        # The location ID of the destination storage container.
        ${StorageLocation},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Category('Body')]
        [System.String]
        # The SAS URL for the destination storage container.
        # It must grant write permission.
        ${StorageSASUri},
    
        [Parameter()]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )
    
    process {
        if ($PSBoundParameters['StorageAccountId']) {
            $PSBoundParameters['DestinationStorageSubscriptionId'] = [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Models.Utilities]::ParseSubscriptionFromId($PSBoundParameters['StorageAccountId'])
        }
        $PSBoundParameters['RecordType'] = [System.String]::Join(",", [Microsoft.Azure.PowerShell.Cmdlets.ApplicationInsights.Models.Utilities]::ConvertToRecordType($PSBoundParameters['DocumentType']))
        $null = $PSBoundParameters.Remove('DocumentType')
        $PSBoundParameters['IsEnabled'] = 'true'

        . Az.ApplicationInsights.internal\New-AzApplicationInsightsContinuousExport @PSBoundParameters
    }
}
    
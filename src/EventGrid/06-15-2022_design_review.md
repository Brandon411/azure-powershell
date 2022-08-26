

<!-- Please not that the SLA for initial reviews is 3 business days. The response may be slow during the week before release. Please ping Azure PowerShell team for urgent request. -->

## Guidelines

The purpose of the Azure PowerShell design review is to ensure that the cmdlets follow the same pattern across the Azure modules. An early design review reduces the risk of unnecessary implementation changes caused by a cmdlet syntax design change.

Please ensure your cmdlets comply with the design guidelines outlined in the [PowerShell Design Guidelines document](https://github.com/Azure/azure-powershell/tree/master/documentation/development-docs/design-guidelines).

Please generate cmdlets syntax using [`GenerateCmdletDesignMarkdown.ps1`](https://github.com/Azure/azure-powershell/tree/main/tools#:~:text=with%20sufficient%20permission.-,GenerateCmdletDesignMarkdown.ps1,-generates%20the%20cmdlet) for review if your cmdlet is generated from API spec directly by Autorest.PowerShell.

If you just add parameter to existing cmdlets and parameter definition complies with guideline, the design review is not expected.

- Have you read above statement?

    - `Yes`

## Service Release Details

- Is this an Embargoed Preview, A Public Preview, or a General Release?

    - `General Release`

- What is the expected service release date?

    - `06-15-2022`
    
- Which [Powershell module](https://github.com/Azure/azure-powershell/blob/main/documentation/azure-powershell-modules.md) are these changes being made in?

    - `Az.EventGrid`

## Contact Information

- Main developer contacts (emails + github aliases)

    - `Brandon Neff: brandonneff@microsoft.com, Brandon411`

- PM contact (email + github alias) 

    - `Roberto Cervantes Rivero: robece@microsoft.com`
    - `Javier Fernandez: jafernan@microsoft.com`

- Other people who should attend a design review (email)

    - `Ashraf Hamad: ahamad@microsoft.com`
    - `Kishore Kumar Peskhar: kishp@microsoft.com`

## High Level Scenarios

- Describe how your feature is intended to be used by customers.

    - [Partner Events overview for customers - Azure Event Grid | Microsoft Docs](https://docs.microsoft.com/en-us/azure/event-grid/partner-events-overview)

    - Azure Event Grid's **Partner Events** allows customers to **subscribe to events** that originate in a registered system using the same mechanism they would use for any other event source on Azure, such as an Azure service. Those registered systems integrate with Event Grid are known as "partners".

      This feature also enables customers to **send events** to partner systems that support receiving and routing events to customer's solutions/endpoints in their platform. Typically, partners are software-as-a-service (SaaS) or [ERP](https://en.wikipedia.org/wiki/Enterprise_resource_planning) providers, but they might be corporate platforms wishing to make their events available to internal teams.

      They purposely integrate with Event Grid to realize end-to-end customer use cases that end on Azure (customers subscribe to events sent by partner) or end on a partner system (customers subscribe to Microsoft events sent by Azure Event Grid). Customers bank on Azure Event Grid to send events published by a partner to supported destinations such as webhooks, Azure Functions, Azure Event Hubs, or Azure Service Bus, to name a few.

- Piping scenarios / how these cmdlets are used with existing cmdlets

    - `{ SCENARIOS OUTLINED HERE }`

- Sample of end-to-end usage

    - Please provide comprehensive examples that don't assume additional setup. It helps the audience understand your feature.

    - `{ SAMPLE USAGE HERE }`

## Specific test cases

Please provide a link to the API tests that exist for this feature. 

- [azure-sdk-for-net/ScenarioTests.PartnerTests.CRUD.cs at main · Azure/azure-sdk-for-net (github.com)](https://github.com/Azure/azure-sdk-for-net/blob/main/sdk/eventgrid/Microsoft.Azure.Management.EventGrid/tests/Tests/ScenarioTests.PartnerTests.CRUD.cs)

## Syntax changes

This should include PowerShell-help style syntax descriptions of all new and changed cmdlets, similar to the syntax portion of PowerShell help (or markdown help), for example:

### New Cmdlets

```powershell
NAME
	Get-AzureEventGridPartnerConfiguration

SYNOPSIS
	Gets a partner configuration or lists all partner configurations in the current Azure subscription.

PS C:\> Get-AzureEventGridPartnerConfiguration 
	[-ResourceGroupName] <String> 
	[-ODataQuery <String>] 
	[-Top <Int32>] 
	[<CommonParameters>]

```

```powershell
NAME
	Get-AzureEventGridPartnerRegistration

SYNOPSIS
	Gets a partner registration or lists all partner registrations in the current Azure subscription.

PS C:\> Get-AzureEventGridPartnerRegistration 
	[-ResourceGroupName] <String> 
	[-Name] <string> 
	[-ODataQuery <String>] 
	[-Top <Int32>] 
	[<CommonParameters>]

PS C:\> Get-AzureEventGridPartnerRegistration [-ResourceId] <String> [-ODataQuery <String>] [-Top <Int32>] [<CommonParameters>]

```

```powershell
NAME
	Get-AzureEventGridPartnerDestination

SYNOPSIS
	Gets a partner destination or lists all partner registrations in the current Azure subscription.

PS C:\> Get-AzureEventGridPartnerDestination 
	[-ResourceGroupName] <String> 
	[-Name] <string> 
	[-ODataQuery <String>] 
	[-Top <Int32>] 
	[<CommonParameters>]

PS C:\> Get-AzureEventGridPartnerDestination 
	[-ResourceId] <String> 
	[-Name] <string> 
	[-ODataQuery <String>] 
	[-Top <Int32>] 
	[<CommonParameters>]

```

```powershell
NAME
	Get-AzureEventGridVerifiedPartner

SYNOPSIS
	Gets a verified partner or lists all verified partners in the current tenant.

PS C:\> Get-AzureEventGridVerifiedPartner 
	[-VerifiedPartnerName <String>] 
	[-ODataQuery <String>] 
	[-Top <Int32>] 
	[<CommonParameters>]

```

```powershell
NAME
	Get-AzureEventGridPartnerNamespace

SYNOPSIS
	Gets a partner namespace or lists all partner namespaces in the current Azure subscription.

PS C:\> Get-AzureEventGridPartnerNamespace 
	[-ResourceGroupName] <String> 
	[-Name] <String> 
	[-ODataQuery <String>] 
	[-Top <Int32>]
    [<CommonParameters>]

PS C:\> Get-AzureEventGridPartnerNamespace 
	[-ResourceId] <String> 
	[-ODataQuery <String>] 
	[-Top <Int32>] 
	[<CommonParameters>]

```

```powershell
NAME
	Get-AzureEventGridChannel

SYNOPSIS
	Gets a channel or lists all channels under a partner namespace.

PS C:\> Get-AzureEventGridChannel 
	[-ResourceGroupName] <String> 
	[-PartnerNamespaceName] <String> 
	[-Name] <String> 
	[-ODataQuery <String>] 
	[-Top <Int32>]
    [<CommonParameters>]

PS C:\> Get-AzureEventGridChannel 
	[-ResourceId] <String>
    [-ODataQuery <String>]
    [-Top <Int32>]
    [<CommonParameters>]

```

```powershell
NAME
	Get-AzureEventGridPartnerNamespaceKey

SYNOPSIS
	Lists all keys under a partner namespace.

PS C:\> Get-AzureEventGridPartnerNamespaceKey 
	[-ResourceGroupName] <String> 
	[-PartnerNamespaceName] <String>
    [-ODataQuery <String>]
    [-Top <Int32>]
    [<CommonParameters>]

```

```powershell
NAME
	Get-AzureEventGridPartnerTopic

SYNOPSIS
	Gets a partner topic or lists all partner topics in the current Azure subscription.

PS C:\> Get-AzureEventGridPartnerTopic 
	[-ResourceGroupName] <String> 
	[-Name] <String>
    [-ODataQuery <String>]
    [-Top <Int32>]
    [<CommonParameters>]

PS C:\> Get-AzureEventGridPartnerTopic
	[-ResourceId] <String>
    [-ODataQuery <String>]
    [-Top <Int32>]
    [<CommonParameters>]

```

```powershell
NAME
	Get-AzureEventGridPartnerTopicEventSubscription

SYNOPSIS
	Gets the details of a partner topic event subscription or lists all event subscriptions under a partner topic.

PS C:\> Get-AzureEventGridPartnerTopicEventSubscription
	[-ResourceGroupName] <String>
    [-PartnerTopicName] <String>
    [-Name] <String>
    [-ODataQuery <String>]
    [-Top <Int32>] 
    [<CommonParameters>]

PS C:\> Get-AzureEventGridPartnerTopicEventSubscription 
	[-ResourceId] <String>
    [-ODataQuery <String>]
    [-Top <Int32>] 
    [<CommonParameters>]

```

```powershell
NAME
	Get-AzureEventGridTopicEventSubscription

SYNOPSIS
	Gets the details of a topic event subscription or lists all event subscriptions under a topic.

PS C:\> Get-AzureEventGridTopicEventSubscription 
	[-ResourceGroupName] <String>
    [-TopicName] <String>
    [-Name] <String>
    [-ODataQuery <String>]
    [-Top <Int32>]
    [<CommonParameters>]

PS C:\> Get-AzureEventGridTopicEventSubscription 
	[-ResourceId] <String>
    [-ODataQuery <String>]
    [-Top <Int32>]
    [<CommonParameters>]

```

```powershell
NAME
	Get-AzureEventGridDomainEventSubscription

SYNOPSIS
	Gets the details of a topic event subscription or lists all event subscriptions under a domain.

PS C:\> Get-AzureEventGridDomainEventSubscription 
	[-ResourceGroupName] <String>
    [-DomainName] <String>
    [-Name] <String>
    [-ODataQuery <String>]
    [-Top <Int32>]
    [<CommonParameters>]

PS C:\> Get-AzureEventGridDomainEventSubscription 
	[-ResourceId] <String>
    [-ODataQuery <String>]
    [-Top <Int32>] 
    [<CommonParameters>]

```

```powershell
NAME
	Get-AzureEventGridDomainTopicEventSubscription

SYNOPSIS
	Gets the details of a domain topic event subscription or lists all event subscriptions under a domain topic.

PS C:\> Get-AzureEventGridDomainTopicEventSubscription 
	[-ResourceGroupName] <String>
    [-DomainName] <String>
    [-TopicName] <String>
    [-Name] <String>
    [-ODataQuery <String>] 
    [-Top <Int32>]
    [<CommonParameters>]

PS C:\> Get-AzureEventGridDomainTopicEventSubscription 
	[-ResourceId] <String>
    [-ODataQuery <String>]
    [-Top <Int32>]
    [<CommonParameters>]

```


```powershell
NAME
	New-AzureEventGridPartnerConfiguration

SYNOPSIS
	Creates a new partner configuration.

PS C:\> New-AzureEventGridPartnerConfiguration 
	[-ResourceGroupName] <String>
    [-AuthorizedPartner <PartnerAuthorization[]>]
    [-DefaultMaxExpirationTimeInDays <Int32>]
    [-Tags <Hashtable>]
    [<CommonParameters>]
 
PartnerAuthorization = <String, DateTime>
```

```powershell
NAME
	New-AzureEventGridPartnerRegistration

SYNOPSIS
	Creates a new partner registration.

PS C:\> New-AzureEventGridPartnerRegistration 
	[-ResourceGroupName] <String>
    [-Name] <String>
    [-AuthorizedSubscriptionIds <String[]>]
    [-Tags <Hashtable>]
    [<CommonParameters>]
 
```

```powershell
NAME
	New-AzureEventGridPartnerDestination

SYNOPSIS
	Creates a new partner destination.

PS C:\> New-AzureEventGridPartnerDestination 
	[-ResourceGroupName] <String> 
	[-Name] <String> 
	[-Location] <String> 
	[-ActivationExpirationDate <DateTime>] 
	[-EndpointServiceContext <String>] 
	[-EndpointBaseUrl <String>] 
	[-MessageForActivation <String>] 
	[-PartnerRegistrationImmutableId <String>] 
	[-Tags <Hashtable>] 
	[<CommonParameters>]
 
```

```powershell
NAME
	New-AzureEventGridPartnerNamespace

SYNOPSIS
	Creates a new partner namespace.

PS C:\> New-AzureEventGridPartnerNamespace 
	[-ResourceGroupName] <String>
    [-Name] <String>
    [-PartnerRegistrationId] <String>
    [-Location <String>]
    [-Tags <Hashtable>]
    [<CommonParameters>]
 
```

```powershell
NAME
	New-AzureEventGridChannel

SYNOPSIS
	Creates a new channel.

PS C:\> New-AzureEventGridChannel 
	[-ResourceGroupName] <String>
    [-PartnerNamespaceName] <String>
    [-Name] 
    [-DestinationSubscriptionId] <String>
    [-DestinationResourceGroup] <String>
    [-AadApplicationId <String>]
    [-AadTenantId <String>]
    [-ActivationExpirationDate <DateTime>]
    [-EndpointServiceContext <String>]
    [-EndointUrl <String>]
    [-EventTypeKind <{Inline}>]
    [-InlineEventType <InlineEvent[]>]
    [-MessageForActivation <String>]
    [-PartnerDestinationName <String>]
    [-PartnerTopicName <String>]
    [-PartnerTopicSource <String>]
    [-Tags <Hashtable>]
    [<CommonParameters>]

InlineEvent = [-Key] <String> [-Description <String>] [-DocumentationUrl <String>] [-DataSchemaUrl <String>]
 
```

```powershell
NAME
	New-AzureEventGridTopicEventSubscription

SYNOPSIS
	Creates a new event subscription for a topic.

PS C:\> New-AzureEventGridTopicEventSubscription
   -EventSubscriptionName <String>
   -ResourceGroupName <String>
   -TopicName <String>
   [-AzureActiveDirectoryApplicationIdOrUri <String>]
   [-AzureActiveDirectoryTenantId <String>]
   [-DeadLetterEndpoint <String>]
   [-DeliveryAttributeMapping <String[]>]
   [-Endpoint <String>]
   [-EndpointType <String>]
   [-DeliverySchema <String>]
   [-EventTtl <Int32>]
   [-ExpirationDate <DateTime>]
   [-Label <String[]>]
   [-MaxDeliveryAttempt <Int32>]
   [-MaxEventsPerBatch <Int32>]
   [-PreferredBatchSizeInKiloByte <Int32>]
   [-StorageQueueMessageTtl <Int64>]
   [-AdvancedFilter <Hashtable[]>]
   [-AdvancedFilteringOnArray]
   [-IncludedEventType <String[]>]
   [-SubjectBeginsWith <String>]
   [-SubjectEndsWith <String>]
   [-SubjectCaseSensitive]
   [-DefaultProfile <IAzureContextContainer>]
   [-WhatIf]
   [-Confirm]
   [<CommonParameters>]
 
```

```powershell
NAME
	New-AzureEventGridTopicEventSubscription

SYNOPSIS
	Creates a new event subscription for a topic.

PS C:\> New-AzureEventGridTopicEventSubscription
   -EventSubscriptionName <String>
   -ResourceGroupName <String>
   -TopicName <String>
   [-AzureActiveDirectoryApplicationIdOrUri <String>]
   [-AzureActiveDirectoryTenantId <String>]
   [-DeadLetterEndpoint <String>]
   [-DeliveryAttributeMapping <String[]>]
   [-Endpoint <String>]
   [-EndpointType <String>]
   [-DeliverySchema <String>]
   [-EventTtl <Int32>]
   [-ExpirationDate <DateTime>]
   [-Label <String[]>]
   [-MaxDeliveryAttempt <Int32>]
   [-MaxEventsPerBatch <Int32>]
   [-PreferredBatchSizeInKiloByte <Int32>]
   [-StorageQueueMessageTtl <Int64>]
   [-AdvancedFilter <Hashtable[]>]
   [-AdvancedFilteringOnArray]
   [-IncludedEventType <String[]>]
   [-SubjectBeginsWith <String>]
   [-SubjectEndsWith <String>]
   [-SubjectCaseSensitive]
   [-DefaultProfile <IAzureContextContainer>]
   [-WhatIf]
   [-Confirm]
   [<CommonParameters>]
 
```


```powershell
NAME
	New-AzureEventGridDomainEventSubscription

SYNOPSIS
	Creates a new event subscription for a domain.

PS C:\> New-AzureEventGridDomainEventSubscription
   -EventSubscriptionName <String>
   -ResourceGroupName <String>
   -DomainName <String>
   [-AzureActiveDirectoryApplicationIdOrUri <String>]
   [-AzureActiveDirectoryTenantId <String>]
   [-DeadLetterEndpoint <String>]
   [-DeliveryAttributeMapping <String[]>]
   [-Endpoint <String>]
   [-EndpointType <String>]
   [-DeliverySchema <String>]
   [-EventTtl <Int32>]
   [-ExpirationDate <DateTime>]
   [-Label <String[]>]
   [-MaxDeliveryAttempt <Int32>]
   [-MaxEventsPerBatch <Int32>]
   [-PreferredBatchSizeInKiloByte <Int32>]
   [-StorageQueueMessageTtl <Int64>]
   [-AdvancedFilter <Hashtable[]>]
   [-AdvancedFilteringOnArray]
   [-IncludedEventType <String[]>]
   [-SubjectBeginsWith <String>]
   [-SubjectEndsWith <String>]
   [-SubjectCaseSensitive]
   [-DefaultProfile <IAzureContextContainer>]
   [-WhatIf]
   [-Confirm]
   [<CommonParameters>]
 
```

```powershell
NAME
	New-AzureEventGridDomainTopicEventSubscription

SYNOPSIS
	Creates a new event subscription for a domain topic.

PS C:\> New-AzureEventGridDomainTopicEventSubscription
   -EventSubscriptionName <String>
   -ResourceGroupName <String>
   -DomainName <String>
   -TopicName <String>
   [-AzureActiveDirectoryApplicationIdOrUri <String>]
   [-AzureActiveDirectoryTenantId <String>]
   [-DeadLetterEndpoint <String>]
   [-DeliveryAttributeMapping <String[]>]
   [-Endpoint <String>]
   [-EndpointType <String>]
   [-DeliverySchema <String>]
   [-EventTtl <Int32>]
   [-ExpirationDate <DateTime>]
   [-Label <String[]>]
   [-MaxDeliveryAttempt <Int32>]
   [-MaxEventsPerBatch <Int32>]
   [-PreferredBatchSizeInKiloByte <Int32>]
   [-StorageQueueMessageTtl <Int64>]
   [-AdvancedFilter <Hashtable[]>]
   [-AdvancedFilteringOnArray]
   [-IncludedEventType <String[]>]
   [-SubjectBeginsWith <String>]
   [-SubjectEndsWith <String>]
   [-SubjectCaseSensitive]
   [-DefaultProfile <IAzureContextContainer>]
   [-WhatIf]
   [-Confirm]
   [<CommonParameters>]
 
```

```powershell
NAME
	Update-AzureEventGridPartnerConfiguration

SYNOPSIS
	Updates the details of a partner configuration.

PS C:\> Update-AzureEventGridPartnerConfiguration 
	-ResourceGroupName <String>
	[-DefaultMaxExpirationTimeInDays <Int32]
	[-Tags <Hashtable]
 
```

```powershell
NAME
	Update-AzEventGridPartnerDestination

SYNOPSIS
	Updates the details of a partner destination.

PS C:\> Update-AzEventGridPartnerDestination 
	[-ResourceGroupName] <String>
	[-Name] <String>
	[-Tags <Hashtable]
	
PS C:\> Update-AzEventGridPartnerDestination 
	[-ResourceId] <String>
	[-Tags <Hashtable]
 
```

```powershell
NAME
	Update-AzEventGridChannel

SYNOPSIS
	Updates the details of a channel.

PS C:\> Update-AzEventGridChannel 
	[-ResourceGroupName] <String> 
	[-PartnerNamespaceName] <String> 
	[-Name] <String>
	[-AadApplicationId <String>]
    [-AadTenantId <String>]
    [-ActivationExpirationDate <DateTime>] 
    [-EndpointBaseUrl <String>] 
    [-EndointUrl <String>] 
    [-EventTypeKind <{Inline}>]
    [-InlineEventType <InlineEvent[]>] 
    [<CommonParameters>]
	
InlineEvent = [-Key] <String> [-Description <String>] [-DocumentationUrl <String>] [-DataSchemaUrl <String>]
 
```

```powershell
NAME
	Update-AzEventGridPartnerTopicEventSubscription

SYNOPSIS
	Updates the details of a partner topic event subscription.

PS C:\> Update-AzEventGridPartnerTopicEventSubscription
      -EventSubscriptionName <String>
      -ResourceGroupName <String>
      -PartnerTopicName <String>
      [-DeadLetterEndpoint <String>]
      [-DeliveryAttributeMapping <String[]>]
      [-Endpoint <String>]
      [-EndpointType <String>]
      [-Label <String[]>]
      [-StorageQueueMessageTtl <Int64>]
      [-AdvancedFilter <Hashtable[]>]
      [-AdvancedFilteringOnArray]
      [-IncludedEventType <String[]>]
      [-SubjectBeginsWith <String>]
      [-SubjectEndsWith <String>]
      [-SubjectCaseSensitive]
      [-DefaultProfile <IAzureContextContainer>]
      [-WhatIf]
      [-Confirm]
      [<CommonParameters>]
 
```

```powershell
NAME
	Update-AzEventGridTopicEventSubscription

SYNOPSIS
	Updates the details of a topic event subscription.

PS C:\> Update-AzEventGridTopicEventSubscription
      -EventSubscriptionName <String>
      -ResourceGroupName <String>
      -TopicTopicName <String>
      [-DeadLetterEndpoint <String>]
      [-DeliveryAttributeMapping <String[]>]
      [-Endpoint <String>]
      [-EndpointType <String>]
      [-Label <String[]>]
      [-StorageQueueMessageTtl <Int64>]
      [-AdvancedFilter <Hashtable[]>]
      [-AdvancedFilteringOnArray]
      [-IncludedEventType <String[]>]
      [-SubjectBeginsWith <String>]
      [-SubjectEndsWith <String>]
      [-SubjectCaseSensitive]
      [-DefaultProfile <IAzureContextContainer>]
      [-WhatIf]
      [-Confirm]
      [<CommonParameters>]
 
```

```powershell
NAME
	Update-AzEventGridDomainEventSubscription

SYNOPSIS
	Updates the details of a domain event subscription.

PS C:\> Update-AzEventGridDomainEventSubscription
      -EventSubscriptionName <String>
      -ResourceGroupName <String>
      -DomainTopicName <String>
      [-DeadLetterEndpoint <String>]
      [-DeliveryAttributeMapping <String[]>]
      [-Endpoint <String>]
      [-EndpointType <String>]
      [-Label <String[]>]
      [-StorageQueueMessageTtl <Int64>]
      [-AdvancedFilter <Hashtable[]>]
      [-AdvancedFilteringOnArray]
      [-IncludedEventType <String[]>]
      [-SubjectBeginsWith <String>]
      [-SubjectEndsWith <String>]
      [-SubjectCaseSensitive]
      [-DefaultProfile <IAzureContextContainer>]
      [-WhatIf]
      [-Confirm]
      [<CommonParameters>]
     
```

```powershell
NAME
	Update-AzEventGridDomainTopicEventSubscription

SYNOPSIS
	Updates the details of a domain topic event subscription.

PS C:\> Update-AzEventGridDomainTopicEventSubscription
      -EventSubscriptionName <String>
      -ResourceGroupName <String>
      -DomainTopicName <String>
      [-DeadLetterEndpoint <String>]
      [-DeliveryAttributeMapping <String[]>]
      [-Endpoint <String>]
      [-EndpointType <String>]
      [-Label <String[]>]
      [-StorageQueueMessageTtl <Int64>]
      [-AdvancedFilter <Hashtable[]>]
      [-AdvancedFilteringOnArray]
      [-IncludedEventType <String[]>]
      [-SubjectBeginsWith <String>]
      [-SubjectEndsWith <String>]
      [-SubjectCaseSensitive]
      [-DefaultProfile <IAzureContextContainer>]
      [-WhatIf]
      [-Confirm]
      [<CommonParameters>]
     
```

```powershell
NAME
	Remove-AzEventGridPartnerRegistration

SYNOPSIS
	Removes a partner registration.

PS C:\> Remove-AzEventGridPartnerRegistration 
	[-ResourceGroupName] <String> 
	[-Name] <String>
	[-Confirm] 
	[<CommonParameters>]
	
PS C:\> Remove-AzEventGridPartnerRegistration 
	[-ResourceId] <String> 
	[-Confirm] 
	[<CommonParameters>]
	
```

```powershell
NAME
	Remove-AzEventGridPartnerConfiguration

SYNOPSIS
	Removes a partner configuration.

PS C:\> Remove-AzureEventGridPartnerConfiguration 
	[-ResourceGroupName] <String> 
	[-Confirm] 
	[<CommonParameters>]
	
```

```powershell
NAME
	Remove-AzEventGridPartnerDestination

SYNOPSIS
	Removes a partner destination.

PS C:\> Remove-AzEventGridPartnerDestination 
	[-ResourceGroupName] <String> 
	[-Name] <String>
	[-Confirm] 
	[<CommonParameters>]
	
PS C:\> Remove-AzEventGridPartnerDestination 
	[-ResourceId] <String> 
	[-Confirm] 
	[<CommonParameters>]
	
```

```powershell
NAME
	Remove-AzEventGridPartnerNamespace

SYNOPSIS
	Removes a partner namespace.

PS C:\> Remove-AzEventGridPartnerNamespace 
	[-ResourceGroupName] <String> 
	[-Name] <String>
	[-Confirm] 
	[<CommonParameters>]
	
PS C:\> Remove-AzEventGridPartnerNamespace 
	[-ResourceId] <String> 
	[-Confirm] 
	[<CommonParameters>]
	
```

```powershell
NAME
	Remove-AzEventGridChannel

SYNOPSIS
	Removes a channel.

PS C:\> Remove-AzEventGridChannel 
	[-ResourceGroupName] <String> 
	[-PartnerNamespaceName] <String>
	[-Name] <String>
	[-Confirm] 
	[<CommonParameters>]
	
PS C:\> Remove-AzEventGridChannel 
	[-ResourceId] <String> 
	[-Confirm] 
	[<CommonParameters>]
	
```

```powershell
NAME
	Remove-AzEventGridPartnerTopic

SYNOPSIS
	Removes a partner topic.

PS C:\> Remove-AzEventGridPartnerTopic 
	[-ResourceGroupName] <String> 
	[-Name] <String>
	[-Confirm] 
	[<CommonParameters>]
	
PS C:\> Remove-AzEventGridPartnerTopic 
	[-ResourceId] <String> 
	[-Confirm] 
	[<CommonParameters>]
	
```

```powershell
NAME
	Remove-AzEventGridTopicEventSubscription

SYNOPSIS
	Removes a topic event subscription.

PS C:\> Remove-AzEventGridTopicEventSubscription 
	[-ResourceGroupName] <String> 
	[-TopicName] <String>
	[-Name] <String>
	[-Confirm] 
	[<CommonParameters>]
	
PS C:\> Remove-AzEventGridTopicEventSubscription 
	[-ResourceId] <String> 
	[-Confirm] 
	[<CommonParameters>]
	
```

```powershell
NAME
	Remove-AzEventGridDomainEventSubscription

SYNOPSIS
	Removes a domain event subscription.

PS C:\> Remove-AzEventGridDomainEventSubscription 
	[-ResourceGroupName] <String> 
	[-DomainName] <String>
	[-Name] <String>
	[-Confirm] 
	[<CommonParameters>]
	
PS C:\> Remove-AzEventGridDomainEventSubscription 
	[-ResourceId] <String> 
	[-Confirm] 
	[<CommonParameters>]
	
```

```powershell
NAME
	Remove-AzEventGridDomainTopicEventSubscription

SYNOPSIS
	Removes a domain topic event subscription.

PS C:\> Remove-AzEventGridDomainTopicEventSubscription 
	[-ResourceGroupName] <String> 
	[-DomainName] <String>
	[-TopicName] <String>
	[-Name] <String>
	[-Confirm] 
	[<CommonParameters>]
	
PS C:\> Remove-AzEventGridDomainTopicEventSubscription 
	[-ResourceId] <String> 
	[-Confirm] 
	[<CommonParameters>]
	
```

```powershell
NAME
	Remove-AzEventGridPartnerTopicEventSubscription

SYNOPSIS
	Removes a domain topic event subscription.

PS C:\> Remove-AzEventGridPartnerTopicEventSubscription 
	[-ResourceGroupName] <String> 
	[-PartnerTopicName] <String>
	[-Name] <String>
	[-Confirm] 
	[<CommonParameters>]
	
PS C:\> Remove-AzEventGridPartnerTopicEventSubscription 
	[-ResourceId] <String> 
	[-Confirm] 
	[<CommonParameters>]
	
```

```powershell
NAME
	Authorize-AzEventGridPartnerConfiguration

SYNOPSIS
	Authorizes a partner configuration.

PS C:\> Authorize-AzEventGridPartnerConfiguration
	[-ResourceGroupName] <String> 
	[-AuthorizationExpirationDate <DateTime>]
	[-PartnerName <String>]
    [-PartnerRegistrationImmutableId <String>]
	[<CommonParameters>]
	
```

```powershell
NAME
	Unauthorize-AzEventGridPartnerConfiguration

SYNOPSIS
	Unauthorizes a partner configuration.

PS C:\> Unauthorize-AzEventGridPartnerConfiguration
	[-ResourceGroupName] <String> 
	[-AuthorizationExpirationDate <DateTime>]
	[-PartnerName <String>]
    [-PartnerRegistrationImmutableId <String>]
	[<CommonParameters>]
	
```

```powershell
NAME
	Activate-AzEventGridPartnerDestination

SYNOPSIS
	Activates a partner destination.

PS C:\> Activate-AzEventGridPartnerDestination
	[-ResourceGroupName] <String> 
	[-Name] <String>
    [<CommonParameters>]
	
PS C:\> Activate-AzEventGridPartnerDestination
	[-ResourceId] <String> 
    [<CommonParameters>]
	
```

```powershell
NAME
	Activate-AzEventGridPartnerTopic

SYNOPSIS
	Activates a partner topic.

PS C:\> Activate-AzEventGridPartnerTopic
	[-ResourceGroupName] <String> 
	[-Name] <String>
    [<CommonParameters>]
	
PS C:\> Activate-AzEventGridPartnerTopic
	[-ResourceId] <String> 
    [<CommonParameters>]
	
```

```powershell
NAME
	Regenerate-AzEventGridPartnerNamespaceKey

SYNOPSIS
	Regenerate a shared access key of a partner namespace.

PS C:\> Regenerate-AzEventGridPartnerNamespaceKey
	[-ResourceGroupName] <String> 
	[-PartnerNamespaceName] <String>
	[-KeyName] <String>
    [<CommonParameters>]
	
PS C:\> Regenerate-AzEventGridPartnerNamespaceKey
	[-ResourceId] <String> 
    [<CommonParameters>]
	
```

## Additional information

- Link to the OpenAPI (swagger) spec

    - [azure-rest-api-specs-pr/EventGrid.json at main · Azure/azure-rest-api-specs-pr (github.com)](https://github.com/Azure/azure-rest-api-specs-pr/blob/main/specification/eventgrid/resource-manager/Microsoft.EventGrid/stable/2022-06-15/EventGrid.json)
    
- Link to any other Github work related to this request

    - { LINK HERE }
    
- Indicate any feature flags or restrictions on the changes provided in this design specification. 

```
For example:
    - New parameter A can only be used when old parameter B is set to value C. 
    - This feature requires the subscription to be on the 'allowlist' for X feature. 
```
    - { INPUT HERE }
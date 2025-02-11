﻿// ----------------------------------------------------------------------------------
//
// Copyright Microsoft Corporation
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ----------------------------------------------------------------------------------

using System.Management.Automation;
using Microsoft.Azure.Commands.MarketplaceOrdering.Common;
using Microsoft.Azure.Commands.MarketplaceOrdering.Models;
using Microsoft.Azure.Management.MarketplaceOrdering;
using Microsoft.Azure.Management.MarketplaceOrdering.Models;
using Microsoft.WindowsAzure.Commands.Common.CustomAttributes;

namespace Microsoft.Azure.Commands.MarketplaceOrdering.Cmdlets.Agreements
{
    [GenericBreakingChange("Cmdlet will call GET /subscriptions/{subscriptionId}/providers/Microsoft.MarketplaceOrdering/offerTypes/{offerType}/publishers/{publisherId}/offers/{offerId}/plans/{planId}/agreements/current by default in an upcoming breaking change release.")]
    [Cmdlet("Get", ResourceManager.Common.AzureRMConstants.AzureRMPrefix + "MarketplaceTerms", DefaultParameterSetName = Constants.ParameterSetNames.AgreementAcceptParameterSet), OutputType(typeof(PSAgreementTerms))]
    public class GetAzureRmMarketplaceTerms : AzureMarketplaceOrderingCmdletBase
    {
        [Parameter(Mandatory = true, HelpMessage = "Publisher identifier string of image being deployed.", ParameterSetName = Constants.ParameterSetNames.AgreementAcceptParameterSet)]
        [ValidateNotNullOrEmpty]
        public string Publisher { get; set; }

        [Parameter(Mandatory = true, HelpMessage = "Offer identifier string of image being deployed.", ParameterSetName = Constants.ParameterSetNames.AgreementAcceptParameterSet)]
        [ValidateNotNullOrEmpty]
        public string Product { get; set; }

        [Parameter(Mandatory = true, HelpMessage = "Plan identifier string of image being deployed.", ParameterSetName = Constants.ParameterSetNames.AgreementAcceptParameterSet)]
        [ValidateNotNullOrEmpty]
        public string Name { get; set; }

        public override void ExecuteCmdlet()
        {
            if (ParameterSetName.Equals(Constants.ParameterSetNames.AgreementAcceptParameterSet))
            {
                var agreementTerms = new PSAgreementTerms(MarketplaceOrderingAgreementsClient.MarketplaceAgreements.Get(Publisher, Product, Name));
                WriteObject(agreementTerms);
            }
        }
    }
}

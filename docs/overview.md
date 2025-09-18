# Travel Rule API Overview

## What is Travel Rule?

The Travel Rule is a regulation established by the Financial Action Task Force (FATF) to combat money laundering and terrorist financing. It requires Virtual Asset Service Providers (VASPs) to share transaction information when conducting cross-border transfers of virtual assets.

## Key Requirements

### Information Collection
- **Originator Information**: Name, address, account details
- **Beneficiary Information**: Name, address, account details  
- **Transaction Information**: Amount, currency, transaction time

### Information Sharing
- Share information before or during transaction execution
- Ensure accuracy and completeness of information
- Protect user privacy and data security

### Record Keeping
- Maintain all relevant transaction records
- Comply with local regulatory requirements for record retention
- Ensure traceability of records

## API Purpose

This API allows local entities to submit withdrawal requests that comply with Travel Rule requirements. It provides a standardized way to:

1. Submit withdrawal requests with all necessary Travel Rule information
2. Validate questionnaire data for compliance
3. Receive confirmation of request acceptance or rejection
4. Track Travel Rule record IDs for audit purposes

## Supported Virtual Assets

The API supports withdrawals for various virtual assets including:
- Bitcoin (BTC)
- Ethereum (ETH)
- Tether (USDT)
- Binance Coin (BNB)
- And many more...

## Compliance Features

- **Questionnaire Validation**: Ensures all required Travel Rule information is provided
- **VASP Integration**: Supports transfers to other VASPs with proper identification
- **Audit Trail**: Maintains complete records for regulatory compliance
- **Error Handling**: Provides detailed error messages for compliance issues

## Getting Started

1. Obtain API credentials from Binance
2. Review the questionnaire requirements
3. Implement proper signature generation
4. Submit withdrawal requests with complete Travel Rule data
5. Handle responses and error cases appropriately

For detailed implementation guidance, see the [Authentication](authentication.md) documentation.

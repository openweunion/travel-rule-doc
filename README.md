# Travel Rule API Documentation

This directory contains the complete OpenAPI 3.1 specification for the Travel Rule API, which enables VASPs to submit withdrawal requests that comply with FATF Travel Rule requirements.

## 🌐 Live Documentation

- **GitHub Pages**: https://yourusername.github.io/bitgo-demo/travel-rule-doc/
- **Local Development**: http://localhost:8080 (after running `./deploy.sh`)

## Structure

```
travel-rule-doc/
├── openapi.yaml              # Main OpenAPI specification
├── paths/                    # API endpoint definitions
│   └── withdraw_apply.yaml   # Withdrawal endpoint
├── components/               # Reusable components
│   ├── schemas/             # Data models
│   ├── parameters/          # Common parameters
│   └── responses/           # Common responses
├── docs/                    # Additional documentation
│   ├── overview.md          # API overview
│   └── authentication.md    # Authentication guide
└── README.md               # This file
```

## Quick Start

### Local Development

1. **Start Local Server**:
   ```bash
   ./deploy.sh
   ```
   Then open http://localhost:8080 in your browser

2. **View the API Documentation**:
   - Open `openapi.yaml` in any OpenAPI-compatible tool
   - Use tools like Swagger UI, Redoc, or Postman

3. **Generate Client SDKs**:
   ```bash
   # Using OpenAPI Generator
   openapi-generator-cli generate -i openapi.yaml -g javascript -o ./client-sdk
   ```

4. **Validate the Specification**:
   ```bash
   # Using Swagger Codegen
   swagger-codegen validate -i openapi.yaml
   ```

### GitHub Pages Deployment

The documentation is automatically deployed to GitHub Pages when changes are pushed to the main branch. The deployment is configured in `.github/workflows/deploy-docs.yml`.

## Key Features

- **Complete Travel Rule Compliance**: All required fields and validations
- **Comprehensive Examples**: Multiple use cases and scenarios
- **Error Handling**: Detailed error responses and codes
- **Security**: HMAC SHA256 signature authentication
- **Validation**: Request parameter validation and constraints

## API Endpoints

### POST /localentity/withdraw/apply
Submit a Travel Rule compliant withdrawal request.

**Request Weight**: 600 (UID)

**Required Parameters**:
- `coin`: Virtual asset type (e.g., BTC, ETH)
- `address`: Withdrawal target address
- `amount`: Withdrawal amount
- `timestamp`: Request timestamp
- `questionnaire`: JSON format Travel Rule data

## Questionnaire Structure

The questionnaire contains all Travel Rule compliance information:

```json
{
  "isAddressOwner": 2,        // 1=self, 2=other beneficiary
  "bnfType": 0,               // 0=individual, 1=corporate
  "bnfFirstName": "John",     // Beneficiary first name
  "bnfLastName": "Doe",       // Beneficiary last name
  "country": "us",            // ISO 2-digit country code
  "city": "New York",         // Beneficiary city
  "sendTo": 2,                // 1=private wallet, 2=VASP
  "vasp": "BINANCE",          // VASP code
  "vaspName": "Binance"       // VASP name
}
```

## Authentication

All requests require:
- `X-MBX-APIKEY`: Your API key
- `X-SIGNATURE`: HMAC SHA256 signature

See [authentication.md](docs/authentication.md) for detailed implementation.

## Error Codes

| Code | Description |
|------|-------------|
| -1000 | Bad Request |
| -1001 | Unauthorized |
| -1002 | Internal Server Error |
| -1003 | Forbidden |
| -1004 | Validation Error |

## Tools and Resources

- **Swagger UI**: Interactive API documentation
- **Postman**: API testing and collection import
- **OpenAPI Generator**: Generate client SDKs
- **Redoc**: Beautiful API documentation

## Support

For technical support or questions:
- Review the [overview documentation](docs/overview.md)
- Check the authentication guide
- Validate your request format against the schemas

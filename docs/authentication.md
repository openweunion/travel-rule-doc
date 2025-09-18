# Authentication

## API Key Authentication

All requests to the Travel Rule API require authentication using an API key and signature.

### Required Headers

| Header | Description | Required |
|--------|-------------|----------|
| `X-MBX-APIKEY` | Your API key | Yes |
| `X-SIGNATURE` | Request signature (HMAC SHA256) | Yes |

### Signature Generation

The signature is generated using HMAC SHA256 with your API secret key.

#### Steps to Generate Signature:

1. **Create Query String**: Combine all parameters in alphabetical order
2. **Add Timestamp**: Append `timestamp` parameter
3. **Generate HMAC**: Use HMAC SHA256 with your secret key
4. **Encode Result**: Convert to hexadecimal string

#### Example Implementation:

```javascript
const crypto = require('crypto');

function generateSignature(queryString, secretKey) {
  return crypto
    .createHmac('sha256', secretKey)
    .update(queryString)
    .digest('hex');
}

// Example usage
const params = {
  coin: 'BTC',
  address: '1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa',
  amount: '0.001',
  timestamp: Date.now()
};

const queryString = Object.keys(params)
  .sort()
  .map(key => `${key}=${params[key]}`)
  .join('&');

const signature = generateSignature(queryString, 'your-secret-key');
```

### Security Best Practices

1. **Keep Secret Key Secure**: Never expose your API secret key in client-side code
2. **Use HTTPS**: Always make requests over HTTPS
3. **Validate Timestamps**: Implement timestamp validation to prevent replay attacks
4. **Rotate Keys**: Regularly rotate your API keys
5. **Monitor Usage**: Keep track of API usage and set up alerts for unusual activity

### Error Handling

Common authentication errors:

| Error Code | Description | Solution |
|------------|-------------|----------|
| -1001 | Invalid API key | Verify your API key is correct |
| -1001 | Invalid signature | Check signature generation algorithm |
| -1001 | Missing headers | Ensure both headers are included |
| -1002 | Timestamp out of range | Check system clock synchronization |

### Rate Limiting

The API has rate limits based on your account type:
- **Basic**: 1200 requests per minute
- **VIP**: Higher limits based on VIP level

Rate limit headers are included in responses:
- `X-MBX-USED-WEIGHT-1M`: Weight used in the last 1 minute
- `X-MBX-ORDER-COUNT-1M`: Number of orders in the last 1 minute

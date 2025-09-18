#!/bin/bash

# Deploy Travel Rule API Documentation locally for testing

echo "🚀 Starting Travel Rule API Documentation server..."

# Check if we're in the right directory
if [ ! -f "openapi.yaml" ]; then
    echo "❌ Error: openapi.yaml not found!"
    echo "Please run this script from the travel-rule-doc directory."
    exit 1
fi

# Start a local server
echo "🌐 Starting local server..."
echo "📖 Documentation will be available at:"
echo "   - http://localhost:8080"
echo ""
echo "Press Ctrl+C to stop the server"

python3 -m http.server 8080

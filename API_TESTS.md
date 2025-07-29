# LinkedGen Pro - API Testing Guide

## 🧪 Testing the API Endpoints

### Base URL
- **Local:** `http://localhost:8000`
- **Production:** `https://your-backend-url.onrender.com`

### Authentication

All protected endpoints require a JWT token in the Authorization header:
```
Authorization: Bearer <your-jwt-token>
```

## 📋 API Endpoints

### 1. Health Check
```bash
GET /health
```

**Response:**
```json
{
  "status": "OK",
  "timestamp": "2024-01-15T10:30:00.000Z"
}
```

### 2. Authentication

#### Register User
```bash
POST /api/register
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "secret123"
}
```

**Response:**
```json
{
  "id": "uuid",
  "email": "user@example.com",
  "token": "jwt-token"
}
```

#### Login User
```bash
POST /api/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "secret123"
}
```

**Response:**
```json
{
  "token": "jwt-token"
}
```

### 3. Leads Management

#### Get All Leads
```bash
GET /api/leads
Authorization: Bearer <token>
```

**Response:**
```json
[
  {
    "id": "uuid",
    "name": "John Doe",
    "company": "Acme Inc",
    "industry": "Technology",
    "score": 85.5,
    "created_at": "2024-01-15T10:30:00.000Z"
  }
]
```

#### Generate Leads
```bash
POST /api/leads/generate
Authorization: Bearer <token>
```

**Response:**
```json
{
  "generated": 20,
  "source": "apollo",
  "leads": [...]
}
```

#### Get Lead by ID
```bash
GET /api/leads/{id}
Authorization: Bearer <token>
```

#### Delete Lead
```bash
DELETE /api/leads/{id}
Authorization: Bearer <token>
```

### 4. AI Message Generation

#### Generate Message
```bash
POST /api/messages/generate
Authorization: Bearer <token>
Content-Type: application/json

{
  "lead_id": "uuid",
  "type": "initial"
}
```

**Response:**
```json
{
  "message": "Hi John, I noticed Acme Inc is doing some interesting work...",
  "message_id": "uuid",
  "type": "initial"
}
```

#### Get Messages for Lead
```bash
GET /api/messages/lead/{leadId}
Authorization: Bearer <token>
```

#### Get All Messages
```bash
GET /api/messages
Authorization: Bearer <token>
```

### 5. ICP Profiles

#### Get All ICP Profiles
```bash
GET /api/icp
Authorization: Bearer <token>
```

#### Create ICP Profile
```bash
POST /api/icp
Authorization: Bearer <token>
Content-Type: application/json

{
  "name": "Tech Startups",
  "industries": ["Technology", "SaaS"],
  "geography": ["United States", "Canada"]
}
```

## 🧪 Testing with cURL

### Complete Test Flow

1. **Register a new user:**
```bash
curl -X POST http://localhost:8000/api/register \
  -H "Content-Type: application/json" \
  -d '{"email": "test@example.com", "password": "password123"}'
```

2. **Login:**
```bash
curl -X POST http://localhost:8000/api/login \
  -H "Content-Type: application/json" \
  -d '{"email": "test@example.com", "password": "password123"}'
```

3. **Generate leads:**
```bash
curl -X POST http://localhost:8000/api/leads/generate \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

4. **Get leads:**
```bash
curl -X GET http://localhost:8000/api/leads \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

5. **Generate AI message:**
```bash
curl -X POST http://localhost:8000/api/messages/generate \
  -H "Authorization: Bearer YOUR_TOKEN_HERE" \
  -H "Content-Type: application/json" \
  -d '{"lead_id": "LEAD_ID_HERE", "type": "initial"}'
```

## 🧪 Testing with Postman

### Import Collection

Create a new collection in Postman with these requests:

1. **Environment Variables:**
   - `base_url`: `http://localhost:8000`
   - `token`: (will be set after login)

2. **Pre-request Script for Login:**
```javascript
pm.sendRequest({
    url: pm.environment.get("base_url") + "/api/login",
    method: 'POST',
    header: {
        'Content-Type': 'application/json'
    },
    body: {
        mode: 'raw',
        raw: JSON.stringify({
            email: "test@example.com",
            password: "password123"
        })
    }
}, function (err, response) {
    if (response.json().token) {
        pm.environment.set("token", response.json().token);
    }
});
```

3. **Authorization Header:**
   - Type: Bearer Token
   - Token: `{{token}}`

## 🧪 Testing with JavaScript

### Using Fetch API

```javascript
const API_BASE = 'http://localhost:8000';

// Register
async function register(email, password) {
  const response = await fetch(`${API_BASE}/api/register`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ email, password }),
  });
  return response.json();
}

// Login
async function login(email, password) {
  const response = await fetch(`${API_BASE}/api/login`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ email, password }),
  });
  return response.json();
}

// Generate leads
async function generateLeads(token) {
  const response = await fetch(`${API_BASE}/api/leads/generate`, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${token}`,
    },
  });
  return response.json();
}

// Generate message
async function generateMessage(token, leadId) {
  const response = await fetch(`${API_BASE}/api/messages/generate`, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ lead_id: leadId, type: 'initial' }),
  });
  return response.json();
}
```

## 🧪 Testing with Python

### Using requests library

```python
import requests
import json

API_BASE = 'http://localhost:8000'

def test_api():
    # Register
    register_data = {
        'email': 'test@example.com',
        'password': 'password123'
    }
    
    response = requests.post(f'{API_BASE}/api/register', json=register_data)
    print('Register:', response.json())
    
    # Login
    login_data = {
        'email': 'test@example.com',
        'password': 'password123'
    }
    
    response = requests.post(f'{API_BASE}/api/login', json=login_data)
    token = response.json()['token']
    print('Login:', response.json())
    
    # Generate leads
    headers = {'Authorization': f'Bearer {token}'}
    response = requests.post(f'{API_BASE}/api/leads/generate', headers=headers)
    print('Generate leads:', response.json())
    
    # Get leads
    response = requests.get(f'{API_BASE}/api/leads', headers=headers)
    leads = response.json()
    print('Get leads:', leads)
    
    if leads:
        # Generate message
        message_data = {
            'lead_id': leads[0]['id'],
            'type': 'initial'
        }
        response = requests.post(
            f'{API_BASE}/api/messages/generate', 
            headers=headers, 
            json=message_data
        )
        print('Generate message:', response.json())

if __name__ == '__main__':
    test_api()
```

## 🔍 Error Testing

### Test Error Scenarios

1. **Invalid credentials:**
```bash
curl -X POST http://localhost:8000/api/login \
  -H "Content-Type: application/json" \
  -d '{"email": "wrong@example.com", "password": "wrong"}'
```

2. **Missing token:**
```bash
curl -X GET http://localhost:8000/api/leads
```

3. **Invalid lead ID:**
```bash
curl -X POST http://localhost:8000/api/messages/generate \
  -H "Authorization: Bearer YOUR_TOKEN_HERE" \
  -H "Content-Type: application/json" \
  -d '{"lead_id": "invalid-uuid", "type": "initial"}'
```

## 📊 Expected Error Responses

```json
{
  "error": "Invalid credentials"
}
```

```json
{
  "error": "Access token required"
}
```

```json
{
  "error": "Lead not found"
}
```

## ✅ Success Criteria

- All endpoints return correct status codes
- JWT authentication works properly
- Lead generation creates mock data
- AI message generation works (with fallback)
- Database operations succeed
- Error handling works as expected 
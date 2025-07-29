# LinkedGen Pro – AI-Powered LinkedIn Lead Generation Platform

A complete SaaS B2B lead generation platform with AI-powered LinkedIn messaging.

## 🚀 Features

- **AI-Powered Messaging**: Generate personalized LinkedIn messages using OpenAI GPT-4o
- **Lead Generation**: Integrate with Apollo API for lead discovery
- **Telegram Integration**: Receive notifications via Telegram Bot
- **Modern UI**: Beautiful React + Next.js frontend with Tailwind CSS
- **Scalable Backend**: Node.js + Express + TypeScript API
- **Database**: PostgreSQL with proper schema and migrations

## 🛠 Tech Stack

### Frontend
- React 18 + Next.js 14
- Tailwind CSS
- TypeScript
- Vercel deployment

### Backend
- Node.js + Express
- TypeScript
- PostgreSQL
- JWT Authentication
- OpenAI GPT-4o Integration
- Apollo API Integration
- Telegram Bot Integration

### Infrastructure
- Docker & Docker Compose
- Render (Backend + Database)
- Vercel (Frontend)

## 🏃‍♂️ Quick Start

### Local Development

1. **Clone and setup:**
```bash
git clone <repository-url>
cd linkedgen-pro
```

2. **Start with Docker:**
```bash
docker-compose up -d
```

3. **Access the application:**
- Frontend: http://localhost:3000
- Backend API: http://localhost:8000
- Database: localhost:5432

### Environment Variables

Create `.env` files in both `frontend/` and `backend/` directories:

**Frontend (.env.local):**
```
NEXT_PUBLIC_API_URL=http://localhost:8000
```

**Backend (.env):**
```
PORT=8000
DATABASE_URL=postgresql://postgres:password@localhost:5432/linkedgen_pro
JWT_SECRET=your-super-secret-jwt-key
OPENAI_API_KEY=your-openai-api-key
APOLLO_API_KEY=your-apollo-api-key
TELEGRAM_BOT_TOKEN=your-telegram-bot-token
```

## 📁 Project Structure

```
linkedgen-pro/
├── frontend/                 # Next.js React application
├── backend/                  # Node.js Express API
├── database/                 # PostgreSQL migrations
├── docker-compose.yml        # Local development setup
├── Dockerfile.frontend       # Frontend Docker image
├── Dockerfile.backend        # Backend Docker image
└── README.md
```

## 🚀 Deployment

### Frontend (Vercel)
1. Connect your GitHub repository to Vercel
2. Set environment variables in Vercel dashboard
3. Deploy automatically on push to main branch

### Backend + Database (Render)
1. Create PostgreSQL database on Render
2. Deploy backend service on Render
3. Set environment variables in Render dashboard

## 📚 API Documentation

The API follows OpenAPI 3.0 specification with endpoints for:
- Authentication (register/login)
- Lead management
- AI message generation
- ICP profile management

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

MIT License - see LICENSE file for details 
# LinkedGen Pro - Deployment Guide

## 🚀 Quick Deployment

### 1. Local Development Setup

1. **Clone the repository:**
```bash
git clone <your-repo-url>
cd linkedgen-pro
```

2. **Set up environment variables:**
```bash
# Backend
cp backend/env.example backend/.env
# Edit backend/.env with your API keys

# Frontend
cp frontend/env.example frontend/.env.local
# Edit frontend/.env.local with your API URL
```

3. **Start with Docker:**
```bash
docker-compose up -d
```

4. **Access the application:**
- Frontend: http://localhost:3000
- Backend API: http://localhost:8000
- Database: localhost:5432

### 2. Production Deployment

#### Backend + Database (Render)

1. **Connect your GitHub repository to Render**

2. **Create a new Web Service:**
   - Name: `linkedgen-pro-api`
   - Environment: Node
   - Build Command: `cd backend && npm install && npm run build`
   - Start Command: `cd backend && npm start`

3. **Set Environment Variables:**
   ```
   NODE_ENV=production
   PORT=10000
   JWT_SECRET=your-super-secret-jwt-key
   OPENAI_API_KEY=your-openai-api-key
   APOLLO_API_KEY=your-apollo-api-key
   TELEGRAM_BOT_TOKEN=your-telegram-bot-token
   TELEGRAM_CHAT_ID=your-telegram-chat-id
   FRONTEND_URL=https://your-frontend-url.vercel.app
   ```

4. **Create PostgreSQL Database:**
   - Create a new PostgreSQL service on Render
   - Name: `linkedgen-pro-db`
   - Copy the connection string to `DATABASE_URL`

#### Frontend (Vercel)

1. **Connect your GitHub repository to Vercel**

2. **Configure the project:**
   - Framework Preset: Next.js
   - Root Directory: `frontend`
   - Build Command: `npm run build`
   - Output Directory: `.next`

3. **Set Environment Variables:**
   ```
   NEXT_PUBLIC_API_URL=https://your-backend-url.onrender.com
   ```

4. **Deploy**

### 3. API Keys Setup

#### OpenAI API Key
1. Go to [OpenAI Platform](https://platform.openai.com/)
2. Create an account and get your API key
3. Add to environment variables

#### Apollo API Key
1. Go to [Apollo.io](https://apollo.io/)
2. Sign up and get your API key
3. Add to environment variables

#### Telegram Bot
1. Message [@BotFather](https://t.me/botfather) on Telegram
2. Create a new bot and get the token
3. Get your chat ID by messaging [@userinfobot](https://t.me/userinfobot)
4. Add both to environment variables

### 4. Database Migration

The database schema will be automatically created when the backend starts for the first time using the `database/init.sql` file.

### 5. Testing the Deployment

1. **Test Backend Health:**
```bash
curl https://your-backend-url.onrender.com/health
```

2. **Test Frontend:**
- Visit your Vercel URL
- Try registering a new account
- Test lead generation and message creation

### 6. Monitoring

- **Render Dashboard:** Monitor backend logs and database
- **Vercel Dashboard:** Monitor frontend performance
- **Telegram Notifications:** Receive alerts for lead generation and message creation

## 🔧 Troubleshooting

### Common Issues

1. **CORS Errors:**
   - Ensure `FRONTEND_URL` is set correctly in backend environment
   - Check that the frontend URL matches exactly

2. **Database Connection:**
   - Verify `DATABASE_URL` is correct
   - Check if the database is accessible from Render

3. **API Key Issues:**
   - Ensure all API keys are valid and have proper permissions
   - Check API rate limits

4. **Build Failures:**
   - Check Node.js version compatibility
   - Verify all dependencies are properly installed

### Support

For issues or questions:
1. Check the logs in Render/Vercel dashboards
2. Verify environment variables are set correctly
3. Test API endpoints individually

## 📊 Performance Optimization

1. **Database Indexing:** Already configured in `init.sql`
2. **Caching:** Consider adding Redis for session storage
3. **CDN:** Vercel provides automatic CDN for static assets
4. **Rate Limiting:** Already implemented in the backend

## 🔒 Security Considerations

1. **JWT Secret:** Use a strong, unique secret in production
2. **API Keys:** Never commit API keys to version control
3. **HTTPS:** Both Vercel and Render provide HTTPS by default
4. **CORS:** Properly configured for production domains 
# 🚀 Деплой LinkedGen Pro с новым репозиторием

## ✅ РЕШЕНИЕ: Создайте новый репозиторий

Поскольку `linkedgen-pro` уже существует, создайте новый репозиторий:

### 1️⃣ Создайте новый GitHub репозиторий

**Варианты имен:**
- `linkedgen-pro-saas`
- `linkedgen-ai-platform`
- `linkedgen-lead-gen`
- `linkedgen-pro-v2`
- `linkedgen-pro-[ваше-имя]`

**Шаги:**
1. Перейдите на https://github.com
2. Нажмите "New repository"
3. Назовите репозиторий: `linkedgen-pro-saas` (или другое имя)
4. Оставьте его публичным
5. НЕ инициализируйте с README
6. Нажмите "Create repository"

### 2️⃣ Загрузите файлы в новый репозиторий

1. В вашем новом репозитории нажмите "uploading an existing file"
2. Перетащите ВСЕ файлы из папки проекта в GitHub
3. Добавьте сообщение коммита: "Initial commit: LinkedGen Pro SaaS Platform"
4. Нажмите "Commit changes"

### 3️⃣ Деплой на Render (Backend + Database)

1. Перейдите на https://render.com
2. Создайте аккаунт или войдите
3. Нажмите **"New Blueprint Instance"**
4. Подключите GitHub аккаунт
5. Выберите ваш НОВЫЙ репозиторий (например, `linkedgen-pro-saas`)
6. Нажмите **"Create New Blueprint Instance"**
7. Дождитесь завершения деплоя (5-10 минут)

**После деплоя настройте переменные окружения:**

В Render Dashboard → Ваш сервис → Environment → Add Environment Variable:

```
OPENAI_API_KEY = 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

APOLLO_API_KEY = 8YOc8ZiUxcXOQzvulGNFgw

TELEGRAM_BOT_TOKEN = 8479434590:AAG1lyWGY-D94GHAXePUk50Y9EuZh4sdE1g

TELEGRAM_CHAT_ID = 364944570
```

### 4️⃣ Деплой на Vercel (Frontend)

1. Перейдите на https://vercel.com
2. Создайте аккаунт или войдите
3. Нажмите **"New Project"**
4. Подключите GitHub аккаунт
5. Выберите ваш НОВЫЙ репозиторий
6. В настройках проекта:
   - **Root Directory**: `./frontend`
   - **Build Command**: `npm run build`
   - **Output Directory**: `.next`
7. Добавьте переменную окружения:
   - **Name**: `NEXT_PUBLIC_API_URL`
   - **Value**: `https://your-backend-name.onrender.com` (замените на реальный URL)
8. Нажмите **"Deploy"**

## 🔗 Ваши ссылки будут:

- **Backend**: `https://your-app-name.onrender.com`
- **Frontend**: `https://your-app-name.vercel.app`
- **Health Check**: `https://your-app-name.onrender.com/health`

## 🎉 ГОТОВО!

После выполнения этих шагов у вас будет полностью работающий SaaS продукт с новым именем репозитория!

## 📞 Если что-то не работает:

1. **Проверьте логи** в Render/Vercel Dashboard
2. **Убедитесь**, что все переменные окружения настроены
3. **Подождите** 5-10 минут после деплоя
4. **Проверьте** файл `API_TESTS.md` для тестирования 
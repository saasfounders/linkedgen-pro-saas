# 🚀 Быстрый деплой LinkedGen Pro

## ✅ Проверка ключей завершена
- ✅ OpenAI API Key: Работает
- ✅ Apollo API Key: Настроен
- ✅ Telegram Bot Token: Работает
- ✅ Telegram Chat ID: Настроен

## 🌐 Деплой на Render (Backend + Database)

### Шаг 1: Создание аккаунта на Render
1. Перейдите на https://render.com
2. Создайте аккаунт или войдите
3. Нажмите "New Blueprint Instance"

### Шаг 2: Подключение репозитория
1. Подключите GitHub (если нет аккаунта, создайте)
2. Выберите репозиторий с этим проектом
3. Нажмите "Create New Blueprint Instance"

### Шаг 3: Настройка переменных окружения
После деплоя (5-10 минут) настройте переменные:

**В Render Dashboard → Ваш сервис → Environment:**

```
OPENAI_API_KEY=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

APOLLO_API_KEY=8YOc8ZiUxcXOQzvulGNFgw

TELEGRAM_BOT_TOKEN=8479434590:AAG1lyWGY-D94GHAXePUk50Y9EuZh4sdE1g

TELEGRAM_CHAT_ID=364944570
```

## 🎨 Деплой на Vercel (Frontend)

### Шаг 1: Создание аккаунта на Vercel
1. Перейдите на https://vercel.com
2. Создайте аккаунт или войдите
3. Нажмите "New Project"

### Шаг 2: Настройка проекта
1. Подключите GitHub репозиторий
2. В настройках проекта:
   - **Root Directory**: `./frontend`
   - **Build Command**: `npm run build`
   - **Output Directory**: `.next`

### Шаг 3: Настройка переменных окружения
Добавьте переменную:
```
NEXT_PUBLIC_API_URL=https://your-backend-name.onrender.com
```
(Замените на реальный URL вашего backend)

## 🔗 Ссылки после деплоя

- **Backend API**: `https://your-app-name.onrender.com`
- **Frontend**: `https://your-app-name.vercel.app`
- **Health Check**: `https://your-app-name.onrender.com/health`

## 🧪 Тестирование

1. **Проверьте backend**: Откройте health check URL
2. **Проверьте frontend**: Откройте frontend URL
3. **Зарегистрируйтесь**: Создайте аккаунт
4. **Протестируйте функции**:
   - Генерация лидов
   - Создание AI сообщений
   - Telegram уведомления

## 📞 Поддержка

Если что-то не работает:
1. Проверьте логи в Render/Vercel Dashboard
2. Убедитесь, что все переменные окружения настроены
3. Проверьте файл `API_TESTS.md` для тестирования API 
#!/bin/bash

# 🚀 LinkedGen Pro - Автоматический деплой
# Этот скрипт развернет приложение на Render (backend + DB) и Vercel (frontend)

echo "🚀 Начинаем деплой LinkedGen Pro..."

# Проверяем наличие необходимых инструментов
check_requirements() {
    echo "📋 Проверяем требования..."
    
    if ! command -v git &> /dev/null; then
        echo "❌ Git не установлен"
        exit 1
    fi
    
    if ! command -v curl &> /dev/null; then
        echo "❌ curl не установлен"
        exit 1
    fi
    
    echo "✅ Все требования выполнены"
}

# Инициализируем Git репозиторий
init_git() {
    echo "📁 Инициализируем Git репозиторий..."
    
    if [ ! -d ".git" ]; then
        git init
        git add .
        git commit -m "Initial commit: LinkedGen Pro SaaS platform"
        echo "✅ Git репозиторий инициализирован"
    else
        echo "ℹ️ Git репозиторий уже существует"
    fi
}

# Деплой на Render
deploy_to_render() {
    echo "🌐 Деплой на Render (Backend + Database)..."
    
    # Проверяем наличие render.yaml
    if [ ! -f "render.yaml" ]; then
        echo "❌ Файл render.yaml не найден"
        exit 1
    fi
    
    echo "📋 Инструкции для деплоя на Render:"
    echo "1. Перейдите на https://render.com"
    echo "2. Войдите в аккаунт или создайте новый"
    echo "3. Нажмите 'New Blueprint Instance'"
    echo "4. Подключите ваш GitHub репозиторий"
    echo "5. Выберите этот репозиторий"
    echo "6. Нажмите 'Create New Blueprint Instance'"
    echo ""
    echo "🔑 После деплоя настройте переменные окружения:"
    echo "- OPENAI_API_KEY (обязательно)"
    echo "- APOLLO_API_KEY (опционально)"
    echo "- TELEGRAM_BOT_TOKEN (опционально)"
    echo "- TELEGRAM_CHAT_ID (опционально)"
    echo ""
    echo "📝 URL вашего backend будет: https://your-app-name.onrender.com"
}

# Деплой на Vercel
deploy_to_vercel() {
    echo "🌐 Деплой на Vercel (Frontend)..."
    
    # Проверяем наличие vercel.json
    if [ ! -f "vercel.json" ]; then
        echo "❌ Файл vercel.json не найден"
        exit 1
    fi
    
    echo "📋 Инструкции для деплоя на Vercel:"
    echo "1. Перейдите на https://vercel.com"
    echo "2. Войдите в аккаунт или создайте новый"
    echo "3. Нажмите 'New Project'"
    echo "4. Подключите ваш GitHub репозиторий"
    echo "5. Выберите этот репозиторий"
    echo "6. В настройках проекта:"
    echo "   - Root Directory: ./frontend"
    echo "   - Build Command: npm run build"
    echo "   - Output Directory: .next"
    echo "7. Добавьте переменную окружения:"
    echo "   - NEXT_PUBLIC_API_URL: URL вашего backend на Render"
    echo "8. Нажмите 'Deploy'"
    echo ""
    echo "📝 URL вашего фронтенда будет: https://your-app-name.vercel.app"
}

# Создаем README для деплоя
create_deploy_readme() {
    echo "📝 Создаем инструкцию по деплою..."
    
    cat > DEPLOY_INSTRUCTIONS.md << 'EOF'
# 🚀 Инструкция по деплою LinkedGen Pro

## 📋 Предварительные требования

1. **GitHub аккаунт** - для хранения кода
2. **Render аккаунт** - для backend + database
3. **Vercel аккаунт** - для frontend
4. **OpenAI API ключ** - для генерации сообщений

## 🔑 Получение API ключей

### OpenAI API Key (Обязательно)
1. Перейдите на https://platform.openai.com/api-keys
2. Создайте новый ключ
3. Скопируйте ключ (начинается с `sk-`)

### Apollo API Key (Опционально)
1. Перейдите на https://app.apollo.io/#/settings/integrations/api
2. Получите API ключ

### Telegram Bot (Опционально)
1. Напишите @BotFather в Telegram
2. Создайте бота командой `/newbot`
3. Получите токен и Chat ID

## 🌐 Деплой на Render (Backend + Database)

1. Перейдите на https://render.com
2. Войдите в аккаунт
3. Нажмите "New Blueprint Instance"
4. Подключите GitHub репозиторий
5. Выберите этот репозиторий
6. Нажмите "Create New Blueprint Instance"
7. Дождитесь завершения деплоя (5-10 минут)

### Настройка переменных окружения на Render:
1. Перейдите в ваш сервис на Render
2. Откройте вкладку "Environment"
3. Добавьте переменные:
   - `OPENAI_API_KEY` = ваш OpenAI ключ
   - `APOLLO_API_KEY` = ваш Apollo ключ (опционально)
   - `TELEGRAM_BOT_TOKEN` = ваш Telegram токен (опционально)
   - `TELEGRAM_CHAT_ID` = ваш Telegram Chat ID (опционально)

## 🎨 Деплой на Vercel (Frontend)

1. Перейдите на https://vercel.com
2. Войдите в аккаунт
3. Нажмите "New Project"
4. Подключите GitHub репозиторий
5. Выберите этот репозиторий
6. В настройках:
   - Root Directory: `./frontend`
   - Build Command: `npm run build`
   - Output Directory: `.next`
7. Добавьте переменную окружения:
   - `NEXT_PUBLIC_API_URL` = URL вашего backend на Render
8. Нажмите "Deploy"

## ✅ Проверка деплоя

1. **Backend**: https://your-app-name.onrender.com/health
2. **Frontend**: https://your-app-name.vercel.app
3. **API тесты**: См. файл `API_TESTS.md`

## 🔧 Устранение неполадок

### Backend не запускается:
- Проверьте переменные окружения на Render
- Убедитесь, что OpenAI ключ корректный
- Проверьте логи в Render Dashboard

### Frontend не подключается к backend:
- Проверьте `NEXT_PUBLIC_API_URL` в Vercel
- Убедитесь, что backend работает
- Проверьте CORS настройки

### База данных не инициализируется:
- Подождите 5-10 минут после деплоя
- Проверьте логи PostgreSQL в Render
- Убедитесь, что `init.sql` загружен

## 📞 Поддержка

Если возникли проблемы:
1. Проверьте логи в Render/Vercel Dashboard
2. Убедитесь, что все API ключи корректные
3. Проверьте файл `API_TESTS.md` для тестирования
EOF

    echo "✅ Инструкция по деплою создана: DEPLOY_INSTRUCTIONS.md"
}

# Основная функция
main() {
    echo "🎯 LinkedGen Pro - Автоматический деплой"
    echo "=========================================="
    
    check_requirements
    init_git
    create_deploy_readme
    
    echo ""
    echo "🚀 Готово к деплою!"
    echo ""
    deploy_to_render
    echo ""
    deploy_to_vercel
    echo ""
    echo "✅ Все готово! Следуйте инструкциям выше для деплоя."
    echo "📖 Подробная инструкция: DEPLOY_INSTRUCTIONS.md"
    echo "🔑 Настройка ключей: API_KEYS_SETUP.md"
}

# Запуск скрипта
main 
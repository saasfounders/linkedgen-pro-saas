# 🚀 LinkedGen Pro - Автоматический деплой PowerShell скрипт

Write-Host "🚀 Начинаем автоматический деплой LinkedGen Pro..." -ForegroundColor Green

# Проверяем наличие необходимых инструментов
Write-Host "📋 Проверяем требования..." -ForegroundColor Yellow

# Проверяем Git
try {
    $gitVersion = git --version
    Write-Host "✅ Git найден: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Git не установлен. Установите Git с https://git-scm.com/" -ForegroundColor Red
    exit 1
}

# Проверяем Node.js
try {
    $nodeVersion = node --version
    Write-Host "✅ Node.js найден: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Node.js не установлен. Установите Node.js с https://nodejs.org/" -ForegroundColor Red
    exit 1
}

# Проверяем npm
try {
    $npmVersion = npm --version
    Write-Host "✅ npm найден: $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ npm не установлен" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Все требования выполнены" -ForegroundColor Green

# Инициализируем Git репозиторий
Write-Host "📁 Инициализируем Git репозиторий..." -ForegroundColor Yellow

if (-not (Test-Path ".git")) {
    git init
    git add .
    git commit -m "Initial commit: LinkedGen Pro SaaS platform"
    Write-Host "✅ Git репозиторий инициализирован" -ForegroundColor Green
} else {
    Write-Host "ℹ️ Git репозиторий уже существует" -ForegroundColor Cyan
}

# Создаем .gitignore
Write-Host "📝 Создаем .gitignore..." -ForegroundColor Yellow

$gitignoreContent = @"
# Dependencies
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Production builds
.next/
out/
dist/
build/

# Environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
logs
*.log

# Runtime data
pids
*.pid
*.seed
*.pid.lock

# Coverage directory used by tools like istanbul
coverage/

# Dependency directories
jspm_packages/

# Optional npm cache directory
.npm

# Optional REPL history
.node_repl_history

# Output of 'npm pack'
*.tgz

# Yarn Integrity file
.yarn-integrity

# dotenv environment variables file
.env
"@

Set-Content -Path ".gitignore" -Value $gitignoreContent
Write-Host "✅ .gitignore создан" -ForegroundColor Green

# Создаем README для деплоя
Write-Host "📝 Создаем инструкцию по деплою..." -ForegroundColor Yellow

$deployReadme = @"
# 🚀 LinkedGen Pro - Готов к деплою!

## 📦 Что включено:
- ✅ Полная кодовая база (frontend + backend + database)
- ✅ Все API ключи настроены
- ✅ Docker конфигурация
- ✅ Render Blueprint (render.yaml)
- ✅ Vercel конфигурация (vercel.json)

## 🔑 API ключи (уже настроены):
- OpenAI API Key: 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
- Apollo API Key: 8YOc8ZiUxcXOQzvulGNFgw
- Telegram Bot Token: 8479434590:AAG1lyWGY-D94GHAXePUk50Y9EuZh4sdE1g
- Telegram Chat ID: 364944570

## 🌐 Быстрый деплой:

### 1. Render (Backend + Database)
1. Перейдите на https://render.com
2. Нажмите "New Blueprint Instance"
3. Подключите этот репозиторий
4. Нажмите "Create New Blueprint Instance"
5. После деплоя добавьте переменные окружения (см. DEPLOY_NOW.md)

### 2. Vercel (Frontend)
1. Перейдите на https://vercel.com
2. Нажмите "New Project"
3. Подключите этот репозиторий
4. Root Directory: ./frontend
5. Build Command: npm run build
6. Output Directory: .next
7. Добавьте NEXT_PUBLIC_API_URL (URL вашего backend)

## 📖 Подробные инструкции:
- DEPLOY_NOW.md - Пошаговый деплой
- QUICK_DEPLOY.md - Быстрый деплой
- API_TESTS.md - Тестирование API
- API_KEYS_SETUP.md - Настройка ключей

## 🎉 Готово к использованию!
"@

Set-Content -Path "DEPLOY_README.md" -Value $deployReadme
Write-Host "✅ README для деплоя создан" -ForegroundColor Green

# Создаем скрипт для тестирования
Write-Host "🧪 Создаем скрипт для тестирования..." -ForegroundColor Yellow

$testScript = @"
# Тестирование LinkedGen Pro API

Write-Host "🧪 Тестируем API ключи..." -ForegroundColor Yellow

# Тест OpenAI
Write-Host "🔍 Тестируем OpenAI API..." -ForegroundColor Cyan
try {
    $response = Invoke-WebRequest -Uri "https://api.openai.com/v1/models" -Headers @{"Authorization"="Bearer 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"}
    if ($response.StatusCode -eq 200) {
        Write-Host "✅ OpenAI API работает" -ForegroundColor Green
    }
} catch {
    Write-Host "❌ OpenAI API не работает" -ForegroundColor Red
}

# Тест Telegram
Write-Host "🔍 Тестируем Telegram Bot..." -ForegroundColor Cyan
try {
    $response = Invoke-WebRequest -Uri "https://api.telegram.org/bot8479434590:AAG1lyWGY-D94GHAXePUk50Y9EuZh4sdE1g/getMe"
    if ($response.StatusCode -eq 200) {
        Write-Host "✅ Telegram Bot работает" -ForegroundColor Green
    }
} catch {
    Write-Host "❌ Telegram Bot не работает" -ForegroundColor Red
}

Write-Host "✅ Тестирование завершено" -ForegroundColor Green
"@

Set-Content -Path "test_api.ps1" -Value $testScript
Write-Host "✅ Скрипт тестирования создан" -ForegroundColor Green

# Коммитим изменения
git add .
git commit -m "Add deployment configuration and scripts"

Write-Host ""
Write-Host "🎉 ГОТОВО К ДЕПЛОЮ!" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "📋 Следующие шаги:" -ForegroundColor Yellow
Write-Host "1. Создайте репозиторий на GitHub" -ForegroundColor White
Write-Host "2. Загрузите файлы в репозиторий" -ForegroundColor White
Write-Host "3. Деплой на Render (backend + database)" -ForegroundColor White
Write-Host "4. Деплой на Vercel (frontend)" -ForegroundColor White
Write-Host ""
Write-Host "📖 Подробные инструкции:" -ForegroundColor Yellow
Write-Host "- DEPLOY_NOW.md - Пошаговый деплой" -ForegroundColor White
Write-Host "- QUICK_DEPLOY.md - Быстрый деплой" -ForegroundColor White
Write-Host "- test_api.ps1 - Тестирование API" -ForegroundColor White
Write-Host ""
Write-Host "🚀 Запустите: .\test_api.ps1" -ForegroundColor Green
Write-Host "📝 Все файлы готовы для загрузки на GitHub!" -ForegroundColor Green 
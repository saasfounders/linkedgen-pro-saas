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
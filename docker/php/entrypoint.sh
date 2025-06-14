#!/bin/bash

cd /app

# Laravelプロジェクトがないなら作成
if [ ! -f artisan ]; then
    composer create-project laravel/laravel . '^12.0'
fi 

# .env がなければ .env.example をコピー（Laravel 作成後に実施）
if [ -f /tmp/.env.example ]; then
    cp /tmp/.env.example .env
fi

# .envが存在し、APP_KEYが空ならキーを生成
if [ -f .env ] && grep -q '^APP_KEY=$' .env; then
    php artisan key:generate
fi

exec php-fpm
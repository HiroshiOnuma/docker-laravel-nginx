# docker-laravel-nginx



## 概要

Laravel、Nginx、MySQL、Node が揃った開発環境です。
**docker compose up** を実行するだけで、Docker上にLaravel、Nginx、MySQL、Node が立ち上がります。



## バージョン情報

- mysql: 8.0
- php: 8.2
- nginx: 1.28
- node: 22
- laravel: 12.0



## プロジェクト構成

```
docker-laravel-nginx
├── docker
│   ├── mysql
│   │   ├── Dockerfile         # MySQL 用の Docker 設定
│   │   └── my.cnf             # MySQL 設定ファイル
│   ├── nginx
│   │   └── default.conf       # Nginx 設定ファイル
│   └── php
│       ├── Dockerfile         # PHP＋Laravel 実行環境の Dockerfile
│       ├── entrypoint.sh      # コンテナ起動時の初期処理スクリプト
│       └── php.ini            # PHP の設定ファイル
├── src
│   └── Laravelのプロジェクト一式 (docker compose up 実行時に自動作成される)
├── docker-compose.yml         # Docker Compose 定義ファイル
└── .env.example               # Laravel 用環境変数のサンプル 
                               # (Laravel 作成後、自動的に `.env` を上書き)
```



## プロジェクトの立ち上げ方

1. リポジトリをクローンする
```
git clone https://github.com/HiroshiOnuma/docker-laravel-nginx.git
```

2. プロジェクトに移動
```
cd docker-laravel-nginx
```

3. Dockerコンテナを起動する
```
docker compose up -d
```

4. ブラウザで Laravel にアクセス
[http://localhost:8080](http://localhost:8080)



## Viteを使用する場合

1. Vite のホットリロード対応するため、 src/package.json を以下のように修正
```
    "scripts": {
        "build": "vite build",
        "dev": "vite --host"
    }
```

2. Node コンテナに入り、 Vite を起動する
```
docker compose exec node bash
npm run dev
```


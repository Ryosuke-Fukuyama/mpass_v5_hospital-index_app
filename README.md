# README

## 開発言語
- Ruby version '3.0.6'
- rails version '6.1.3.1'

## 実行手順
```
$ git clone
$ docker-compose run web bundle install
$ docker-compose run web yarn install
$ docker-compose run web bundle exec rails webpacker:install
$ docker-compose run web rake rails db:create db:migrate
$ docker-compose run web rake rails db:seed
$ docker-compose up -d
```

## カタログ設計/テーブル定義書
https://docs.google.com/spreadsheets/d/1qh3VYRea-rsGQsdphvExZkfswueoD1OG2d5m3yQ-tn4/edit?usp=sharing

## ワイヤーフレーム
<img src="doc/wireframe_image.drawio" alt="ER図" width='350px'>

## ER図
<img src="doc/er_image.drawio" alt="ER図" width='350px'>

## 画面遷移図
<img src="doc/sf_image.drawio" alt="画面遷移図" width='350px'>
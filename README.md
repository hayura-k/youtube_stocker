# Youtubeストッカー

### 作成した理由

コロナが流行り出してから家にいる機会が増え、それに伴ってYouTubeの動画を見る時間が増えました。Youtube上では自分の好きな動画しかみないですが、他の人の好きな動画なども見たい、また自分の好きな動画もシェアしたい
など思うようになり、他の人も同じように思ってるのではないかと考え、このアプリを作成しました。また、繰り返しみたい動画をストックしておきたいという考えもあり、その機能もこのアプリの中に組み込みました。

### 実装内容

インフラ  
heroku + Postgresql + S3 + Redis
バックエンド  
Rails5.2.3 + ruby 2.6  
フロント  
BMD(bootstrapマテリアルデザイン)4 + jquery  

### 実装機能

・ ログイン機能(sorcery)
・ Google認証   
・ パスワード再設定(Mailerを使用)  
・ ユーザー登録  
・ ゲストログイン  
・ 投稿のCRUD機能  
・ モーダルで投稿作成  
・ YoutubeDataAPIを使用して動画のタイトルと本文を取得  
・ タグづけ機能  
・ 検索機能(タイトル名とタグ名で検索、フォームオブジェクトを使用)    
・ 公開・非公開の権限設定    
・ ページネーション  
・ Fontawesome  
・ コメント機能(Ajax通信で実装) 
・ 国際化  
・ webサーバーをPumaに変更  
・ いいね機能(非同期通信)  
・ redisでセッション管理  
・ 画像投稿機能  
・ 画像プレビュー機能  
・ ランキング機能  
・ meta-tagsを用いてSEO対策・OGPの設定

### 使用した主なgem  

・ sorcery
・ google-api-client  
・ slim-rails  
・ html2slim  
・ pry-rails  
・ pry-byebug  
・ better_errors  
・ binding_of_caller    
・ annotate  
・ font-awesome-sass  
・ kaminari  
・ rails-i18n  
・ rinku  
・ config  
・ letter_opener  
・ enum_help  
・ rubocop  
・ rubocop-rails  
・ carrierwave
・ mini_magick
・ redis-rails  
・ meta-tags

[テーブル設計図](https://gyazo.com/87dbf4413b15a19d85f1884b0456de86)

### 苦労した所

・フォームオブジェクトを使用した検索機能
・YoutubeのAPIを使用して、動画のタイトルと本文を取ってくる
・Googleログインの本番環境用設定

### 工夫した点

・実際の運用のことを想定してOGP画像やmetaタグを設定した。
・ブラウザからURLをコピペする人ばかりじゃないことを知り、サイト上で別タブでYoutubeを開けるようにしたりなど、UXを考えて制作した。
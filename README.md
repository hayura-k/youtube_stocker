# Youtubeストッカー

### 作成した理由

コロナが流行り出してから家にいる機会が増え、それに伴ってYouTubeの動画を見る時間が増えました。Youtube上では自分の好きな動画しかみないですが、他の人の好きな動画なども見たい、また自分の好きな動画もシェアしたい
などを自分が思うようになり、他の人も同じように思ってるのではないかと考え、このアプリを作成しました。また、繰り返しみたい動画をストックしておきたいという考えもあり、その機能もこのアプリの中に組み込みました。

### 実装内容

インフラ
Heroku + Postgresql
フロント
BMD4 + jquery + yarn
バックエンド
Rails５系 + Ruby 

### 実装した機能

・ ログイン機能(sorceryを使用)  
・ Google認証
・ パスワード再設定(Mailerを使用)
・ ユーザー登録  
・ ゲストログイン  
・ 投稿のCRUD機能     
・ YoutubeDataAPIを使用して、動画のタイトルと本文を取得  
・ タグづけ機能  
・ 検索機能（動画のタイトルを検索）  
・ 公開・非公開の権限設定    
・ ページネーション  
・ Fontawesome  
・ モーダルで動画取得  
・ コメント機能（Ajax通信で実装）  
・ 国際化  

### 使用した主なgem

・ sorcery
・ annotate 
・ pry-rails
・ pru-byebug  
・ rails-i18n  
・ config  
・ google-api-client  
・ rinku  
. kaminari  
・ enum_help  
・ font-awesome-sass  

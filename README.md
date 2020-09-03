# Youtubeストッカー

### 作成した理由

コロナが流行り出してから家にいる機会が増え、それに伴ってYouTubeの動画を見る時間が増えました。Youtube上では自分の好きな動画しかみないですが、他の人の好きな動画なども見たい、また自分の好きな動画もシェアしたい
など思うようになり、他の人も同じように思ってるのではないかと考え、このアプリを作成しました。また、繰り返しみたい動画をストックしておきたいという考えもあり、その機能もこのアプリの中に組み込みました。

### 実装内容

インフラ  
heroku + Postgresql  
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
・ 検索機能(タイトルで検索)    
・ 公開・非公開の権限設定    
・ ページネーション  
・ Fontawesome  
・ コメント機能(Ajax通信で実装) 
・ 国際化

### 使用した主なgem  

・ sorcery
・ google-api-client  
・ slim-rails  
・ html2slim  
・ pry-rails ・ pry-byebug  
・ better_errors ・ binding_of_caller  
・ annotate  
・ font-awesome-sass  
・ kaminari  
・ rails-i18n  
・ rinku  
・ config  
・ letter_opener  
・ enum_help  
・ rinku  

[テーブル設計図](https://drive.google.com/file/d/11ey6EfBfC_RPcF8sAm72-AlZz2jJMVQh/view?usp=sharing)
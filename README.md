# Youtubeストッカー

### 実装目的

コロナが拡大し家にいることが増えてYoutubeの動画を見る機会が増えました。その中で常に自分の好きな動画を見るだけではつまらないと思い
他の人の動画もシェアして見ることができたら面白いだろうなと思いました。また、料理動画などの繰り返しみたい動画はストックしておきたいと思ったのでその機能も実装しました。

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

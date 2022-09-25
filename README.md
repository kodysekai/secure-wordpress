# WordPress でのセキュアな環境構築について

WordPress の環境構築時にやっておきたいセキュリティ対策についてまとめる。

色々と調べて回ったがこの方の設定が網羅的ですごく参考になった。

[jurerotar/Wordpress-security-and-performance](https://github.com/jurerotar/Wordpress-security-and-performance)

# ファイルパーミッション

公式を参考に
[wordpress.org](https://ja.wordpress.org/support/article/changing-file-permissions/)

↓ 推奨

```
wp-config.php  400
.htaccess      604
.user.ini      600
wp-includes    700
wp-admin       705
```

# wp-config.php の設定

```php
define('DISALLOW_FILE_EDIT', true);
```

を追記してテーマやプラグインファイルを管理画面から編集できないように。

# .htaccess の設定

↓ を参考にするとよい。

[jurerotar/Wordpress-security-and-performance](https://github.com/jurerotar/Wordpress-security-and-performance)

```
# Prevent access to important files
<FilesMatch "^.*(readme.html|debug.log|error_log|wp-config\.php|php.ini|\.[hH][tT][aApP].*)$">
    Order Deny,Allow
    Deny from all
</FilesMatch>

# Force encrypted connection
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteCond %{HTTPS} off
    RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
</IfModule>
```

は必須かなと。

# プラグインのインストール

以下の 2 つのプラグインを入れる。
wp-cli を入れていれば、`install-plugins.sh`を走らせて Install できる。（ログイン URL が変更されるので、標準出力を確認すること）

## SiteGuard WP Plugin

管理ページとログインに関する攻撃からの防御に特化したセキュリティプラグイン。

- ログインページの変更
- ログイン時の画像認証の追加
- ログイン失敗回数による一定期間のロック
- XMLRPC 無効化
  など

## Wordfence Security

WordPress を保護するためにゼロから構築されたエンドポイントファイアウォールとマルウェアスキャナー機能がある。

- 大規模なチームによって構築および保守された Web Application Firewall（無償版は 30 日遅れ）
- マルウェアスキャン（スキャンに引っかかった場合メールでのアラートあり）
- ログイン 2 段階認証
  など

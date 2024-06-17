# Drupal10を利用したローカル開発環境のテンプレート

### 前提条件
- 以下のソフトウェアがローカルPC環境(Windows)にインストール済みであること
  - WSL2 + Docker + Git
  - Visual Studo Code + 拡張機能(Dev Containers)

### Dev Containersのイメージ
![](./architecture-containers.png "Dev Containersのイメージ")
> [Developing inside a Container](https://code.visualstudio.com/docs/devcontainers/containers) より引用

### テンプレートを試す
1.プロジェクトをクローン、VSCodeを起動

```sh
$ cd {任意のフォルダ}
$ git clone https://github.com/osyaremegane/dev-template-drupal.git
$ cd dev-template-drupal
$ code .
```

2.VSCode上で「Ctrl + Shift + P」を押下、「Reopen in Container」を選択  
![](./dev-container-start-image.png "Reopen in Container")

3.開発環境が起動後、「Enter」を押下。ターミナル上で「apachectl start」を実行
![](./dev-container-started-image.png "Enter")

![](./apache-start-image.png "apache start")

4.Chromeブラウザを起動、Drupalにアクセス。admin / P@ssw0rdでログイン。  
URL：https://localhost 
![](./drupal-start-image.png "apache start")

### フォルダ/ファイル構成の説明
```
.devcontainer
  apache ： コンテナ内のApacheで利用する自己証明書、設定ファイルを配置
  drupal ： コンテナ内のDrupalで利用する設定ファイルを配置
  php ： コンテナ内のPHPで利用するXDebug用設定ファイルを配置
  scripts ： コンテナビルド時、コンテナ起動時に実行するスクリプトファイルを配置
  devcontainer.json ： Dev Container拡張機能で利用する設定ファイル
  docker-compose.yml ： Dockerコンテナを管理するための設定ファイル
  db.Dockerfile ： データベース用のDockerコンテナ設定ファイル  
  web.Dockerfile ： ウェブサーバ用のDockerコンテナ設定ファイル

.gitignore ： 構成管理の対象外リストファイル

private : Drupalの設定フォルダ(private)

sync/config ： Drupalの構成ファイル一式(Drush cexコマンドでエクスポートしたもの)
```

### プロキシ配下で実行する場合
以下のファイルの該当箇所をコメントアウトし、プロキシ情報を記載してください。    
※ WSL、Dockerのプロキシ設定は個別に実施してください。  
・/dev-template-drupal/composer.json
```
"config": {
        // "proxy": "http://[ServerName]:[PortNo]"
}
```

・dev-template-drupal/.devcontainer/web.Dockerfile
```
# RUN pear config-set http_proxy http://[ServerName]:[PortNo]/

```
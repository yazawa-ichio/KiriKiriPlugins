吉里吉里でネットワーク経由でパッチを当てられるプラグインです。
===============

【準備】
------------
下URLのZIPファイルをダウンロードして下さい。
https://raw.githubusercontent.com/yazawa-ichio/KiriKiriPlugins/master/PatchDownloader/PatchDownloader.zip

以下のDLLプラグインが必要になのでダウンロードしてください。

・httprequest.dll
・ktl_storage_stream.dll

上記、２つのプラグインと以下のファイルもプロジェクトに入れて下さい。
・PatchDownloader.ks
・DownloadWindow.tjs
・PDConfig.tjs

【使い方】
------------
・プラグインの設定
「PDConfig.tjs」を編集します。
「version 」はパッチ情報ファイルと比較して、パッチをダウンロードすべきかどうかを判断します。
「infoPath」はパッチ情報のURLを記述します。パッチを出す予定なくても、このプラグインを導入するなら必ず記述して、そこにパッチ情報をアップロードしておいてください。
「encoding」はパッチ情報の文字コードを記述して下さい。一部、対応していないコードが有ります。
「checkPatch」はオートでパッチ情報の確認をするかを決定できます。オートではない場合は「ヘルプ」に「パッチのダウンロード」というメニューが追加されます。

このファイルはパッチを制作するたびにパッチ用アーカイブに入れて下さい。入れなければ正常に動作しません。

・プラグインの登録
「PatchDownloader.ks」をcallタグで呼び出すことでその他必要なファイルは全て呼び出されます。

・パッチ情報の準備
まずはパッチ情報を記録したファイルを用意して下さい。
パッチ情報の書き方はサンプルの「InfoSample.txt」を参考にして下さい。
基本的に2行目にパッチのバージョン、4行目にパッチのURLを記述して下さい。
一応、「PDConfig.tjs」で設定したバッチ情報のURLにファイルがなくても動作します。
パッチの更新があるたび、パッチのアップロードURLを更新してアップロードしてください。

・注意
追加されたパッチは吉里吉里の機能で削除する事が出来ません。そのため、バージョンを上げるたびにパッチが増えていくことになるので注意して下さい。

【ライセンス】
------------
このソースコードのライセンスは「CC0」の元に配布しています。

<p xmlns:dct="http://purl.org/dc/terms/" xmlns:vcard="http://www.w3.org/2001/vcard-rdf/3.0#">
  <a rel="license"
     href="http://creativecommons.org/publicdomain/zero/1.0/">
    <img src="http://i.creativecommons.org/p/zero/1.0/88x31.png" style="border-style: none;" alt="CC0" />
  </a>
  <br />
  To the extent possible under law,
  <a rel="dct:publisher"
     href="https://github.com/yazawa-ichio">
    <span property="dct:title">yazawa-ichio</span></a>
  has waived all copyright and related or neighboring rights to
  <span property="dct:title">KiriKiriPatchDownloader</span>.
This work is published from:
<span property="vcard:Country" datatype="dct:ISO3166"
      content="JP" about="https://github.com/yazawa-ichio">
  日本</span>.
</p>
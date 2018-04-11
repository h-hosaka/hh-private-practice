[Redshiftのテーブルのサイズ一覧を取得（Admin権限のユーザで実行すること）](/redshift/table_size_summary_check.sql)

[COPY文の実行がエラーになった場合の調査方法](/redshift/copy_error_check.sql)  
COPYコマンドでCSVファイルなどをテーブルに挿入する時にエラーが発生した時はこのSQLを実行。  
エラー行ごとに、1行ずつエラー原因などが表示される。  

* line_number:エラーになった行
* colname:エラーになったカラム名
* type:エラーになったカラムの型
* err_reason:エラーの原因

この辺を見て調べる。


（参考）
Redshiftの様々なユーティリティ 
https://github.com/awslabs/amazon-redshift-utils/tree/master/src/AdminScripts 


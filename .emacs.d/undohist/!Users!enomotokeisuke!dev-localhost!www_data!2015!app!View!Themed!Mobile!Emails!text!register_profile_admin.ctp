
((digest . "fca81daad278e876e022ced571419f41") (undo-list nil ("
" . -16) ((marker . 1027) . -1) ((marker . 1027) . -1) nil ("
" . -16) ((marker) . -1) ((marker) . -1) nil ("こんにちは, Goodfind事務局です。" . 17) (t . 1384168576) ((marker) . -21) nil (48 . 52) nil ("お" . -40) nil ("疲" . -41) nil ("れ" . -42) nil ("様" . -43) nil ("で" . -44) nil ("し" . -45) nil ("た" . -46) nil ("、" . -47) nil ("
" . -1) ((marker . 1499) . -1) ((marker . 1) . -1) ((marker . 1) . -1) ((marker . 753) . -1) ((marker . 753) . -1) nil (#("Goodfind関係者各位、

Goodfind2015へのユーザ会員登録を完了いたしました。

入力いただいた内容は以下のようになっております。
<<会員登録情報>>
ユーザID: <?php echo $data['UserDetail']['user_id']; ?>
氏名： <?php echo $data['User']['last_name']; ?> <?php echo $data['User']['first_name']; ?>
フリガナ： <?php echo $data['User']['last_name_kana']; ?> <?php echo $data['User']['first_name_kana']; ?>
性別： <?php echo $sex; ?>
生年月日： <?php echo $data['UserDetail']['birth_date']['year']; ?>年<?php echo $data['UserDetail']['birth_date']['month']; ?>月<?php echo $data['UserDetail']['birth_date']['day']; ?>日
メールアドレス: <?php echo $tmp_user['TmpRegister']['email']; ?>
パスワード： ********
大学名： <?php echo $university[$this->request->data['UserDetail']['university_id']]; ?> <?php echo $data['UserDetail']['university_name']; ?>
学部・研究科： <?php echo $data['UserDetail']['department']; ?>
学科・専攻： <?php echo $data['UserDetail']['major']; ?>
文理区分： <?php echo $bunri; ?>
学年： <?php echo $grade[$data['UserDetail']['grade']]; ?>
卒業日(見込)： <?php echo $data['UserDetail']['grad_year']; ?>年 <?php echo $data['UserDetail']['grad_month']; ?>月
郵便番号： <?php echo $data['UserDetail']['zipcode']; ?>
住所： <?php echo $prefecture[$data['UserDetail']['prefecture']]; ?><?php echo $data['UserDetail']['address']; ?>
電話番号： <?php echo $data['UserDetail']['phone']; ?>

<<アンケート関連>>
アンケート項目１(Goodfindをどこで知りましたか？):
<?php echo $question1; ?>
<?php echo $question1_detail; ?>

アンケート項目２(一番興味のあるGoodfindのコンテンツは何ですか？):
<?php echo $question2; ?>
アンケート項目３(あなたは外国人留学生ですか？)
<?php echo $foreign; ?>

今後ともよろしくお願いいたします。

----
Goodfind 2015

次代を創るビジネスリーダー／アントレプレナーのためのキャリアサイト
<?php echo $http_full_base_url; ?>/<?php echo $base_dir; ?>/
" 75 76 (face web-mode-html-tag-face tag-name "会員登録情報" tag-type start tag-beg t) 76 82 (face web-mode-html-tag-face tag-name "会員登録情報" tag-type start) 82 83 (face web-mode-html-tag-face tag-name "会員登録情報" tag-type start tag-end t) 92 93 (block-side t block-beg t face web-mode-preprocessor-face) 93 97 (block-side t face web-mode-preprocessor-face) 97 98 (block-side t) 98 102 (block-side t face web-mode-keyword-face) 102 104 (block-side t) 104 108 (block-side t face web-mode-variable-name-face) 108 109 (block-side t) 109 121 (block-side t block-token string face web-mode-block-string-face) 121 123 (block-side t) 123 132 (block-side t block-token string face web-mode-block-string-face) 132 135 (block-side t) 135 136 (block-side t face web-mode-preprocessor-face) 136 137 (block-side t block-end t face web-mode-preprocessor-face) 142 143 (block-side t block-beg t face web-mode-preprocessor-face) 143 147 (block-side t face web-mode-preprocessor-face) 147 148 (block-side t) 148 152 (block-side t face web-mode-keyword-face) 152 154 (block-side t) 154 158 (block-side t face web-mode-variable-name-face) 158 159 (block-side t) 159 165 (block-side t block-token string face web-mode-block-string-face) 165 167 (block-side t) 167 178 (block-side t block-token string face web-mode-block-string-face) 178 181 (block-side t) 181 182 (block-side t face web-mode-preprocessor-face) 182 183 (block-side t block-end t face web-mode-preprocessor-face) 184 185 (block-side t block-beg t face web-mode-preprocessor-face) 185 189 (block-side t face web-mode-preprocessor-face) 189 190 (block-side t) 190 194 (block-side t face web-mode-keyword-face) 194 196 (block-side t) 196 200 (block-side t face web-mode-variable-name-face) 200 201 (block-side t) 201 207 (block-side t block-token string face web-mode-block-string-face) 207 209 (block-side t) 209 221 (block-side t block-token string face web-mode-block-string-face) 221 224 (block-side t) 224 225 (block-side t face web-mode-preprocessor-face) 225 226 (block-side t block-end t face web-mode-preprocessor-face) 233 234 (block-side t block-beg t face web-mode-preprocessor-face) 234 238 (block-side t face web-mode-preprocessor-face) 238 239 (block-side t) 239 243 (block-side t face web-mode-keyword-face) 243 245 (block-side t) 245 249 (block-side t face web-mode-variable-name-face) 249 250 (block-side t) 250 256 (block-side t block-token string face web-mode-block-string-face) 256 258 (block-side t) 258 274 (block-side t block-token string face web-mode-block-string-face) 274 277 (block-side t) 277 278 (block-side t face web-mode-preprocessor-face) 278 279 (block-side t block-end t face web-mode-preprocessor-face) 280 281 (block-side t block-beg t face web-mode-preprocessor-face) 281 285 (block-side t face web-mode-preprocessor-face) 285 286 (block-side t) 286 290 (block-side t face web-mode-keyword-face) 290 292 (block-side t) 292 296 (block-side t face web-mode-variable-name-face) 296 297 (block-side t) 297 303 (block-side t block-token string face web-mode-block-string-face) 303 305 (block-side t) 305 322 (block-side t block-token string face web-mode-block-string-face) 322 325 (block-side t) 325 326 (block-side t face web-mode-preprocessor-face) 326 327 (block-side t block-end t face web-mode-preprocessor-face) 332 333 (block-side t block-beg t face web-mode-preprocessor-face) 333 337 (block-side t face web-mode-preprocessor-face) 337 338 (block-side t) 338 342 (block-side t face web-mode-keyword-face) 342 344 (block-side t) 344 347 (block-side t face web-mode-variable-name-face) 347 349 (block-side t) 349 350 (block-side t face web-mode-preprocessor-face) 350 351 (block-side t block-end t face web-mode-preprocessor-face) 358 359 (block-side t block-beg t face web-mode-preprocessor-face) 359 363 (block-side t face web-mode-preprocessor-face) 363 364 (block-side t) 364 368 (block-side t face web-mode-keyword-face) 368 370 (block-side t) 370 374 (block-side t face web-mode-variable-name-face) 374 375 (block-side t) 375 387 (block-side t block-token string face web-mode-block-string-face) 387 389 (block-side t) 389 401 (block-side t block-token string face web-mode-block-string-face) 401 403 (block-side t) 403 409 (block-side t block-token string face web-mode-block-string-face) 409 412 (block-side t) 412 413 (block-side t face web-mode-preprocessor-face) 413 414 (block-side t block-end t face web-mode-preprocessor-face) 415 416 (block-side t block-beg t face web-mode-preprocessor-face) 416 420 (block-side t face web-mode-preprocessor-face) 420 421 (block-side t) 421 425 (block-side t face web-mode-keyword-face) 425 427 (block-side t) 427 431 (block-side t face web-mode-variable-name-face) 431 432 (block-side t) 432 444 (block-side t block-token string face web-mode-block-string-face) 444 446 (block-side t) 446 458 (block-side t block-token string face web-mode-block-string-face) 458 460 (block-side t) 460 467 (block-side t block-token string face web-mode-block-string-face) 467 470 (block-side t) 470 471 (block-side t face web-mode-preprocessor-face) 471 472 (block-side t block-end t face web-mode-preprocessor-face) 473 474 (block-side t block-beg t face web-mode-preprocessor-face) 474 478 (block-side t face web-mode-preprocessor-face) 478 479 (block-side t) 479 483 (block-side t face web-mode-keyword-face) 483 485 (block-side t) 485 489 (block-side t face web-mode-variable-name-face) 489 490 (block-side t) 490 502 (block-side t block-token string face web-mode-block-string-face) 502 504 (block-side t) 504 516 (block-side t block-token string face web-mode-block-string-face) 516 518 (block-side t) 518 523 (block-side t block-token string face web-mode-block-string-face) 523 526 (block-side t) 526 527 (block-side t face web-mode-preprocessor-face) 527 528 (block-side t block-end t face web-mode-preprocessor-face) 539 540 (block-side t block-beg t face web-mode-preprocessor-face) 540 544 (block-side t face web-mode-preprocessor-face) 544 545 (block-side t) 545 549 (block-side t face web-mode-keyword-face) 549 551 (block-side t) 551 559 (block-side t face web-mode-variable-name-face) 559 560 (block-side t) 560 573 (block-side t block-token string face web-mode-block-string-face) 573 575 (block-side t) 575 582 (block-side t block-token string face web-mode-block-string-face) 582 585 (block-side t) 585 586 (block-side t face web-mode-preprocessor-face) 586 587 (block-side t block-end t face web-mode-preprocessor-face) 609 610 (block-side t block-beg t face web-mode-preprocessor-face) 610 614 (block-side t face web-mode-preprocessor-face) 614 615 (block-side t) 615 619 (block-side t face web-mode-keyword-face) 619 621 (block-side t) 621 631 (block-side t face web-mode-variable-name-face) 631 633 (block-side t) 633 637 (block-side t face web-mode-variable-name-face) 637 639 (block-side t) 639 646 (block-side t face web-mode-variable-name-face) 646 648 (block-side t) 648 652 (block-side t face web-mode-variable-name-face) 652 653 (block-side t) 653 665 (block-side t block-token string face web-mode-block-string-face) 665 667 (block-side t) 667 682 (block-side t block-token string face web-mode-block-string-face) 682 686 (block-side t) 686 687 (block-side t face web-mode-preprocessor-face) 687 688 (block-side t block-end t face web-mode-preprocessor-face) 689 690 (block-side t block-beg t face web-mode-preprocessor-face) 690 694 (block-side t face web-mode-preprocessor-face) 694 695 (block-side t) 695 699 (block-side t face web-mode-keyword-face) 699 701 (block-side t) 701 705 (block-side t face web-mode-variable-name-face) 705 706 (block-side t) 706 718 (block-side t block-token string face web-mode-block-string-face) 718 720 (block-side t) 720 737 (block-side t block-token string face web-mode-block-string-face) 737 740 (block-side t) 740 741 (block-side t face web-mode-preprocessor-face) 741 742 (block-side t block-end t face web-mode-preprocessor-face) 751 752 (block-side t block-beg t face web-mode-preprocessor-face) 752 756 (block-side t face web-mode-preprocessor-face) 756 757 (block-side t) 757 761 (block-side t face web-mode-keyword-face) 761 763 (block-side t) 763 767 (block-side t face web-mode-variable-name-face) 767 768 (block-side t) 768 780 (block-side t block-token string face web-mode-block-string-face) 780 782 (block-side t) 782 794 (block-side t block-token string face web-mode-block-string-face) 794 797 (block-side t) 797 798 (block-side t face web-mode-preprocessor-face) 798 799 (block-side t block-end t face web-mode-preprocessor-face) 807 808 (block-side t block-beg t face web-mode-preprocessor-face) 808 812 (block-side t face web-mode-preprocessor-face) 812 813 (block-side t) 813 817 (block-side t face web-mode-keyword-face) 817 819 (block-side t) 819 823 (block-side t face web-mode-variable-name-face) 823 824 (block-side t) 824 836 (block-side t block-token string face web-mode-block-string-face) 836 838 (block-side t) 838 845 (block-side t block-token string face web-mode-block-string-face) 845 848 (block-side t) 848 849 (block-side t face web-mode-preprocessor-face) 849 850 (block-side t block-end t face web-mode-preprocessor-face) 857 858 (block-side t block-beg t face web-mode-preprocessor-face) 858 862 (block-side t face web-mode-preprocessor-face) 862 863 (block-side t) 863 867 (block-side t face web-mode-keyword-face) 867 869 (block-side t) 869 874 (block-side t face web-mode-variable-name-face) 874 876 (block-side t) 876 877 (block-side t face web-mode-preprocessor-face) 877 878 (block-side t block-end t face web-mode-preprocessor-face) 883 884 (block-side t block-beg t face web-mode-preprocessor-face) 884 888 (block-side t face web-mode-preprocessor-face) 888 889 (block-side t) 889 893 (block-side t face web-mode-keyword-face) 893 895 (block-side t) 895 900 (block-side t face web-mode-variable-name-face) 900 902 (block-side t) 902 906 (block-side t face web-mode-variable-name-face) 906 907 (block-side t) 907 919 (block-side t block-token string face web-mode-block-string-face) 919 921 (block-side t) 921 928 (block-side t block-token string face web-mode-block-string-face) 928 932 (block-side t) 932 933 (block-side t face web-mode-preprocessor-face) 933 934 (block-side t block-end t face web-mode-preprocessor-face) 944 945 (block-side t block-beg t face web-mode-preprocessor-face) 945 949 (block-side t face web-mode-preprocessor-face) 949 950 (block-side t) 950 954 (block-side t face web-mode-keyword-face) 954 956 (block-side t) 956 960 (block-side t face web-mode-variable-name-face) 960 961 (block-side t) 961 973 (block-side t block-token string face web-mode-block-string-face) 973 975 (block-side t) 975 986 (block-side t block-token string face web-mode-block-string-face) 986 989 (block-side t) 989 990 (block-side t face web-mode-preprocessor-face) 990 991 (block-side t block-end t face web-mode-preprocessor-face) 993 994 (block-side t block-beg t face web-mode-preprocessor-face) 994 998 (block-side t face web-mode-preprocessor-face) 998 999 (block-side t) 999 1003 (block-side t face web-mode-keyword-face) 1003 1005 (block-side t) 1005 1009 (block-side t face web-mode-variable-name-face) 1009 1010 (block-side t) 1010 1022 (block-side t block-token string face web-mode-block-string-face) 1022 1024 (block-side t) 1024 1036 (block-side t block-token string face web-mode-block-string-face) 1036 1039 (block-side t) 1039 1040 (block-side t face web-mode-preprocessor-face) 1040 1041 (block-side t block-end t face web-mode-preprocessor-face) 1049 1050 (block-side t block-beg t face web-mode-preprocessor-face) 1050 1054 (block-side t face web-mode-preprocessor-face) 1054 1055 (block-side t) 1055 1059 (block-side t face web-mode-keyword-face) 1059 1061 (block-side t) 1061 1065 (block-side t face web-mode-variable-name-face) 1065 1066 (block-side t) 1066 1078 (block-side t block-token string face web-mode-block-string-face) 1078 1080 (block-side t) 1080 1089 (block-side t block-token string face web-mode-block-string-face) 1089 1092 (block-side t) 1092 1093 (block-side t face web-mode-preprocessor-face) 1093 1094 (block-side t block-end t face web-mode-preprocessor-face) 1099 1100 (block-side t block-beg t face web-mode-preprocessor-face) 1100 1104 (block-side t face web-mode-preprocessor-face) 1104 1105 (block-side t) 1105 1109 (block-side t face web-mode-keyword-face) 1109 1111 (block-side t) 1111 1121 (block-side t face web-mode-variable-name-face) 1121 1123 (block-side t) 1123 1127 (block-side t face web-mode-variable-name-face) 1127 1128 (block-side t) 1128 1140 (block-side t block-token string face web-mode-block-string-face) 1140 1142 (block-side t) 1142 1154 (block-side t block-token string face web-mode-block-string-face) 1154 1158 (block-side t) 1158 1159 (block-side t face web-mode-preprocessor-face) 1159 1160 (block-side t block-end t face web-mode-preprocessor-face) 1160 1161 (block-side t block-beg t face web-mode-preprocessor-face) 1161 1165 (block-side t face web-mode-preprocessor-face) 1165 1166 (block-side t) 1166 1170 (block-side t face web-mode-keyword-face) 1170 1172 (block-side t) 1172 1176 (block-side t face web-mode-variable-name-face) 1176 1177 (block-side t) 1177 1189 (block-side t block-token string face web-mode-block-string-face) 1189 1191 (block-side t) 1191 1200 (block-side t block-token string face web-mode-block-string-face) 1200 1203 (block-side t) 1203 1204 (block-side t face web-mode-preprocessor-face) 1204 1205 (block-side t block-end t face web-mode-preprocessor-face) 1212 1213 (block-side t block-beg t face web-mode-preprocessor-face) 1213 1217 (block-side t face web-mode-preprocessor-face) 1217 1218 (block-side t) 1218 1222 (block-side t face web-mode-keyword-face) 1222 1224 (block-side t) 1224 1228 (block-side t face web-mode-variable-name-face) 1228 1229 (block-side t) 1229 1241 (block-side t block-token string face web-mode-block-string-face) 1241 1243 (block-side t) 1243 1250 (block-side t block-token string face web-mode-block-string-face) 1250 1253 (block-side t) 1253 1254 (block-side t face web-mode-preprocessor-face) 1254 1255 (block-side t block-end t face web-mode-preprocessor-face) 1258 1259 (face web-mode-html-tag-face tag-name "アンケート関連" tag-type start tag-beg t) 1259 1266 (face web-mode-html-tag-face tag-name "アンケート関連" tag-type start) 1266 1267 (face web-mode-html-tag-face tag-name "アンケート関連" tag-type start tag-end t) 1300 1301 (block-side t block-beg t face web-mode-preprocessor-face) 1301 1305 (block-side t face web-mode-preprocessor-face) 1305 1306 (block-side t) 1306 1310 (block-side t face web-mode-keyword-face) 1310 1312 (block-side t) 1312 1321 (block-side t face web-mode-variable-name-face) 1321 1323 (block-side t) 1323 1324 (block-side t face web-mode-preprocessor-face) 1324 1325 (block-side t block-end t face web-mode-preprocessor-face) 1326 1327 (block-side t block-beg t face web-mode-preprocessor-face) 1327 1331 (block-side t face web-mode-preprocessor-face) 1331 1332 (block-side t) 1332 1336 (block-side t face web-mode-keyword-face) 1336 1338 (block-side t) 1338 1354 (block-side t face web-mode-variable-name-face) 1354 1356 (block-side t) 1356 1357 (block-side t face web-mode-preprocessor-face) 1357 1358 (block-side t block-end t face web-mode-preprocessor-face) 1399 1400 (block-side t block-beg t face web-mode-preprocessor-face) 1400 1404 (block-side t face web-mode-preprocessor-face) 1404 1405 (block-side t) 1405 1409 (block-side t face web-mode-keyword-face) 1409 1411 (block-side t) 1411 1420 (block-side t face web-mode-variable-name-face) 1420 1422 (block-side t) 1422 1423 (block-side t face web-mode-preprocessor-face) 1423 1424 (block-side t block-end t face web-mode-preprocessor-face) 1450 1451 (block-side t block-beg t face web-mode-preprocessor-face) 1451 1455 (block-side t face web-mode-preprocessor-face) 1455 1456 (block-side t) 1456 1460 (block-side t face web-mode-keyword-face) 1460 1462 (block-side t) 1462 1469 (block-side t face web-mode-variable-name-face) 1469 1471 (block-side t) 1471 1472 (block-side t face web-mode-preprocessor-face) 1472 1473 (block-side t block-end t face web-mode-preprocessor-face) 1548 1549 (block-side t block-beg t face web-mode-preprocessor-face) 1549 1553 (block-side t face web-mode-preprocessor-face) 1553 1554 (block-side t) 1554 1558 (block-side t face web-mode-keyword-face) 1558 1560 (block-side t) 1560 1578 (block-side t face web-mode-variable-name-face) 1578 1580 (block-side t) 1580 1581 (block-side t face web-mode-preprocessor-face) 1581 1582 (block-side t block-end t face web-mode-preprocessor-face) 1583 1584 (block-side t block-beg t face web-mode-preprocessor-face) 1584 1588 (block-side t face web-mode-preprocessor-face) 1588 1589 (block-side t) 1589 1593 (block-side t face web-mode-keyword-face) 1593 1595 (block-side t) 1595 1603 (block-side t face web-mode-variable-name-face) 1603 1605 (block-side t) 1605 1606 (block-side t face web-mode-preprocessor-face) 1606 1607 (block-side t block-end t face web-mode-preprocessor-face)) . 1) 1610 ((marker . 1) . -672) ((marker) . -1609) ((marker) . -1609) ((marker . 16) . -1548) ((marker . 16) . -1548) ((marker . 1) . -1514) ((marker . 1) . -1514) ((marker . 752) . -1425) ((marker . 752) . -1425) ((marker . 613) . -1399) ((marker . 613) . -1399) ((marker . 612) . -1360) ((marker . 612) . -1360) ((marker . 596) . -1359) ((marker . 596) . -1359) ((marker . 595) . -1326) ((marker . 595) . -1326) ((marker . 537) . -1300) ((marker . 537) . -1300) ((marker . 536) . -1269) ((marker . 536) . -1269) ((marker . 140) . -851) ((marker . 140) . -851) ((marker . 141) . -879) ((marker . 141) . -879) ((marker . 230) . -935) ((marker . 230) . -935) ((marker . 231) . -1043) ((marker . 231) . -1043) ((marker . 332) . -1095) ((marker . 332) . -1095) ((marker . 333) . -1206) ((marker . 333) . -1206) ((marker . 357) . -1256) ((marker . 357) . -1256) ((marker . 358) . -1257) ((marker . 358) . -1257) nil (1611 . 3233) nil ("
" . -1611) nil (1611 . 1612) nil (1610 . 1611) (t . 1384164415) nil (" " . -138) nil ("(" . -139) nil ("G" . -140) nil ("F" . -141) nil ("管" . -142) nil ("理" . -143) nil ("者" . -144) nil ("へ" . -145) nil ("の" . -146) nil ("メ" . -147) nil ("ー" . -148) nil ("ル" . -149) nil ("の" . -150) nil ("み" . -151) nil ("表" . -152) nil ("示" . -153) nil (")" . -154) nil (89 . 91) nil (25 . 29) nil ("お" . -17) nil ("疲" . -18) nil ("れ" . -19) nil ("様" . -20) nil ("で" . -21) nil ("し" . -22) nil ("た" . -23) nil ("、" . -24) nil ("
" . -16) nil ("
" . -17) nil ("こんにちは, Goodfind事務局です。" . 17) nil ("番" . -116) nil ("号" . -117) (t . 1371699038)))
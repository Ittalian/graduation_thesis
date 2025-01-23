##writetest_eval.pl

##data
@hasharray = (
	{#résumé
	"Legacy"      => "iso-8859-1",
	"fnameLegacy" => "r\xE9sum\xE9",
	"fnameUTF8"   => "r\xC3\xA9sum\xC3\xA9"
	},
	{#Übersetzung
	"Legacy"      => "iso-8859-1",
	"fnameLegacy" => "\xDCbersetzung",
	"fnameUTF8"   => "\xC3\x9Cbersetzung"
	},
	{#Bücher
	"Legacy"      => "iso-8859-1",
	"fnameLegacy" => "B\xFCcher",
	"fnameUTF8"   => "B\xC3\xBCcher"
	},
	{#Übersetzung
	"Legacy"      => "iso-8859-2",
	"fnameLegacy" => "\xDCbersetzung",
	"fnameUTF8"   => "\xC3\x9Cbersetzung"
	},
	{#előírás
	"Legacy"      => "iso-8859-2",
	"fnameLegacy" => "el\xF5\xEDr\xE1s",
	"fnameUTF8"   => "el\xC5\x91\xC3\xADr\xC3\xA1s"
	},
	{#词典
	"Legacy"      => "gb2312",
	"fnameLegacy" => "\xB4\xCA\xB5\xE4",
	"fnameUTF8"   => "\xE8\xAF\x8D\xE5\x85\xB8"
	},
	{#日記
	"Legacy"      => "shift_jis",
	"fnameLegacy" => "\x93\xFA\x8BL",
	"fnameUTF8"   => "\xE6\x97\xA5\xE8\xA8\x98"
	},
	{#日記
	"Legacy"      => "euc-jp",
	"fnameLegacy" => "\xC6\xFC\xB5\xAD",
	"fnameUTF8"   => "\xE6\x97\xA5\xE8\xA8\x98"
	},
	{#소설
	"Legacy"      => "euc-kr",
	"fnameLegacy" => "\xBC\xD2\xBC\xB3",
	"fnameUTF8"   => "\xEC\x86\x8C\xEC\x84\xA4"
	},
	{#كتب
	"Legacy"      => "iso-8859-6",
	"fnameLegacy" => "\xBC\xD2\xBC\xB3",
	"fnameUTF8"   => "\xD9\x83\xD8\xAA\xD8\xA8"
	},
	{#كتب
	"Legacy"      => "windows-1256",
	"fnameLegacy" => "\xE3\xCA\xC8",
	"fnameUTF8"   => "\xD9\x83\xD8\xAA\xD8\xA8"
	},
	{#перевод
	"Legacy"      => "iso-8859-5",
	"fnameLegacy" => "\xDF\xD5\xE0\xD5\xD2\xDE\xD4",
	"fnameUTF8"   => "\xD0\xBF\xD0\xB5\xD1\x80\xD0\xB5\xD0\xB2\xD0\xBE\xD0\xB4"
	},
	{#перевод
	"Legacy"      => "koi8-r",
	"fnameLegacy" => "\xD0\xC5\xD2\xC5\xD7\xCF\xC4",
	"fnameUTF8"   => "\xD0\xBF\xD0\xB5\xD1\x80\xD0\xB5\xD0\xB2\xD0\xBE\xD0\xB4"
	},
	{#перевод
	"Legacy"      => "windows-1251",
	"fnameLegacy" => "\xEF\xE5\xF0\xE5\xE2\xEE\xE4",
	"fnameUTF8"   => "\xD0\xBF\xD0\xB5\xD1\x80\xD0\xB5\xD0\xB2\xD0\xBE\xD0\xB4"
	}
);

#####a_href#####
$a_href_Legacy =<<'EOF_Legacy';
"<p>
<a href=\"$hasharray[$i]{fnameLegacy}.html\">Click here!! (link to $hasharray[$i]{fnameLegacy}.html)</a>
</p>"
EOF_Legacy
chomp($a_href_Legacy);

$a_href_UTF8 =<<'EOF_UTF8';
"<p>
<a href=\"$hasharray[$i]{fnameUTF8}.html\">Click here!! (link to $hasharray[$i]{fnameUTF8}.html)</a>
</p>"
EOF_UTF8
chomp($a_href_UTF8);

#####area_href#####
$area_href_Legacy =<<'EOF_Legacy';
"<p>This is a link to $hasharray[$i]{fnameLegacy}.html
<img src=\"fuji.jpg\" alt=\"fuji\" width = \"640\" height = \"480\"
 usemap=\"#menu\"/>
<map name=\"menu\">
<area shape=\"rect\" alt=\"fuji\"
coords=\"30,50,215,125\" href=\"$hasharray[$i]{fnameLegacy}.html\">
</map>
</p>"
EOF_Legacy
chomp($area_href_Legacy);

$area_href_UTF8 =<<'EOF_UTF8';
"<p>This is a link to $hasharray[$i]{fnameUTF8}.html
<img src=\"fuji.jpg\" alt=\"fuji\" width = \"640\" height = \"480\"
 usemap=\"#menu\"/>
<map name=\"menu\">
<area shape=\"rect\" alt=\"fuji\"
coords=\"30,50,215,125\" href=\"$hasharray[$i]{fnameUTF8}.html\">
</map>
</p>"
EOF_UTF8
chomp($area_href_UTF8);

#####link_href(css)#####
$link_href_CSS =<<'EOF_link_href_CSS';
"<link rel=\"stylesheet\" type=\"text/css\" href=\"$hasharray[$i]{fnameLegacy}.css\">"
EOF_link_href_CSS
chomp($link_href_CSS);

$link_href_Body =<<'EOF_link_href_Body';
"<p>
These words should be white.<br>
This background-color should be blue(#5b94f0).<br>
</p>"
EOF_link_href_Body
chomp($link_href_Body);

#####img_src#####
$img_src_Legacy =<<'EOF';
"<p>
<img src = \"$hasharray[$i]{fnameLegacy}.GIF\" alt = \"fuji\"/>
</p>"
EOF
chomp($img_src_Legacy);

$img_src_UTF8 = $img_src_Legacy;

#####object_classid#####
#相対参照ができない....
#絶対参照にして同じディレクトリにmartins.mpgをおくと動画が再生できるようになる

##参考文献:http://www.ifi.unizh.ch/groups/mml/projects/bcq/
$object_classid_Legacy =<<'EOF';
"<object classid=\"java:$hasharray[$i]{fnameLegacy}.class\" Codetype=\"application/java\" width=400 height=286>
<param name=\"image\" value=\"animal1.bcq\" valuetype=\"data\">
<param name=\"refresh\" value=\"2000\" valuetype=\"data\">
<param name=\"filesize\" value=\"0\" valuetype=\"data\">
</object>"
EOF
chomp($Object_classid_Legacy);

$object_classid_UTF8 = $object_classid_Legacy;

#####object_codebase#####
#5:objecy_classidが相対参照できないのに対して、相対参照ができる！
#$object_codebase_Legacy =<<'EOF';
#"<object classid=\"java:bcqDecoder.class\" Codetype=\"application/java\" width=400 height=286
# codebase = \"http://www.sw.it.aoyama.ac.jp/svn/lab/www/trunk/2005/yone/iritest/
#0.01/Test_8_base_href/$hasharray[$i]{fnameLegacy}.html\">
#<param name=\"image\" value=\"animal1.bcq\" valuetype=\"data\">
#<param name=\"refresh\" value=\"2000\" valuetype=\"data\">
#<param name=\"filesize\" value=\"0\" valuetype=\"data\">
#</object>"
#EOF
#chomp($object_codebase_Legacy);

#$object_codebase_UTF8 = $object_codebase_Legacy;

#####object_data#####
##リンク先のファイルの名前を$hasharray[$i]{・・・}とするが、このファイルをどうやって作成するか？？
##Linux環境でテストを行うため、ファイル名がいろいろな言語になっている作成したファイルをおいておく必要はない
##htmlファイルを作成するためのプログラムがあればよい
$object_data_Legacy =<<'EOF_Legacy';
"<p>
<object data=\"../ITEM/$hasharray[$i]{fnameLegacy}.html\" type=\"text/html\"
 width=\"400\" height=\"400\">
</object>
</p>"
EOF_Legacy
chomp($object_data_Legacy);

$object_data_UTF8 =<<'EOF_UTF8';
"<p>
<object data=\"../ITEM/$hasharray[$i]{fnameUTF8}.html\" type=\"text/html\"
 width=\"400\" height=\"400\">
</object>
</p>"
EOF_UTF8
chomp($object_data_UTF8);

#####base_href#####
##絶対参照でなければならない？？
##usemapのように他ファイルで確認の必要あり？？
##xhtmlでは、絶対パスで指定しなければならない。htmlは？
$base_href_Head =<<'EOF_base_href_Head';
"<base href=\"http://www.sw.it.aoyama.ac.jp/svn/lab/www/trunk/2005/yone/iritest/
0.01/Test_8_base_href/$hasharray[$i]{fnameLegacy}.html\">"
EOF_base_href_Head
chomp($base_href_Head);

$base_href_Legacy =<<'EOF_base_href_Legacy';
"<p>
<a href=\"baselink.html\">Click here!! (link to baselink.html)</a>
</p>"
EOF_base_href_Legacy
chomp($base_href_Legacy);

$base_href_UTF8 = $base_href_Legacy;

#####script_src#####
##URIはsrc部分か、script.jsの中のリンクのhtml部分か？？
$script_src_Head =<<'EOF_script_src_Head';
"<script type=\"text/javascript\" src=\"$hasharray[$i]{fnameLegacy}.js\"></script>"
EOF_script_src_Head
chomp($script_src_Head);

$script_src_Body =<<'EOF_script_src_Legacy';
"<p>
<a href = \"javascript:win()\">Click here!! (open a new window)</a>
</p>"
EOF_script_src_Legacy
chomp($script_src_Body);

#####form_action#####
$form_action_Legacy =<<'EOF_Legacy';
"<form action=\"$hasharray[$i]{fnameLegacy}.html\" method=\"post\">
Text
<input type=\"text\" name=\"name\" value=\"\">
<input type=\"submit\" name=\"send\" value=\"test\">
</form>"
EOF_Legacy
chomp($form_action_Legacy);

$form_action_UTF8 =<<'EOF_UTF8';
"<p>
<form action=\"$hasharray[$i]{fnameUTF8}.html\" method=\"post\">
Text
<input type=\"text\" name=\"name\" value=\"\">
<input type=\"submit\" name=\"send\" value=\"test\">
</p>
</form>"
EOF_UTF8
chomp($form_action_UTF8);

#####input_src#####
$input_src_Legacy =<<'EOF_Legacy';
"<p>
<input type = \"image\" src = \"$hasharray[$i]{fnameLegacy}.GIF\"/>
</p>"
EOF_Legacy
chomp($input_src_Legacy);

$img_src_UTF8 = $img_src_Legacy;

##########<1>add new kind of html-element##########

@element_array = (
	{
	"Element" => "a_href",
	"Legacy"  => $a_href_Legacy,
	"UTF8"    => $a_href_UTF8
	},
	{
	"Element" => "area_href",
	"Legacy"  => $area_href_Legacy,
	"UTF8"    => $area_href_UTF8
	},
	{
	"Element" => "link_href",
	"Head"    => $link_href_CSS,
	"Legacy"  => $link_href_Body,
	"UTF8"    => $link_href_Body
	},
	{
	"Element" => "img_src",	
	"Legacy"  => $img_src_Legacy,
	"UTF8"    => $img_src_UTF8
	},
	{
	"Element" => "object_classid",	
	"Legacy"  => $object_classid_Legacy,
	"UTF8"    => $object_classid_UTF8
	},
#	{
#	"Element" => "object_codebase",	
#	"Legacy"  => $object_codebase_Legacy,
#	"UTF8"    => $object_codebase_UTF8
#	},
	{
	"Element" => "object_data",	
	"Legacy"  => $object_data_Legacy,
	"UTF8"    => $object_data_UTF8
	},
	{
	"Element" => "base_href",	
	"Head"    => $base_href_Head,
	"Legacy"  => $base_href_Legacy,
	"UTF8"    => $base_href_UTF8
	},
	{
	"Element" => "script_src",	
	"Head"    => $script_src_Head,
	"Legacy"  => $script_src_Body,
	"UTF8"    => $script_src_Body
	},
	{
	"Element" => "form_action",	
	"Legacy"  => $form_action_Legacy,
	"UTF8"    => $form_action_UTF8
	},
	{
	"Element" => "input_src",	
	"Legacy"  => $input_src_Legacy,
	"UTF8"    => $input_src_UTF8
	}
);

##########<2>add new element to hash##########

#####html Base#####
$Legacy_Base1 =<<'EOF_Legacy_Base1';
"<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">
<html>
<head>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=$hasharray[$i]{Legacy}\">"
EOF_Legacy_Base1
chomp($Legacy_Base1);

$Legacy_Base2 =<<'EOF_Legacy_Base2';
"<title> $hasharray[$i]{Legacy} Test_$testNo $hasharray[$i]{fnameLegacy} </title>
</head>
<body>
<h1> This page is $hasharray[$i]{Legacy} Test_$testNo $hasharray[$i]{fnameLegacy} </h1>"
EOF_Legacy_Base2
chomp($Legacy_Base2);

$UTF8_Base1 =<<'EOF_UTF8_Base1';
"<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">
<html>
<head>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">"
EOF_UTF8_Base1
chomp($UTF8_Base1);

$UTF8_Base2 =<<'EOF_UTF8_Base2';
"<title> UTF-8 Test_$testNo $hasharray[$i]{fnameUTF8} </title>
</head>
<body>
<h1> This page is UTF-8 Test_$testNo $hasharray[$i]{fnameUTF8} </h1>"
EOF_UTF8_Base2
chomp($UTF8_Base2);
################################################
$Legacy_ResultBase =<<'EOF_Legacy_ResultBase';
"<title> $hasharray[$i]{Legacy} Test_$testNo $hasharray[$i]{fnameLegacy} </title>
</head>
<body>
<h1> This test is successful. </h1>
<h2> This page is result for $hasharray[$i]{Legacy} Test_$testNo $hasharray[$i]{fnameLegacy} </h2>"
EOF_Legacy_ResultBase
chomp($Legacy_ResultBase);

$UTF8_ResultBase =<<'EOF_UTF8_ResultBase';
"<title> UTF-8 Test_$testNo $hasharray[$i]{fnameUTF8} </title>
</head>
<body>
<h1> This test is successful. </h1>
<h2> This page is result for UTF-8 Test_$testNo $hasharray[$i]{fnameUTF8} </h2>"
EOF_UTF8_ResultBase
chomp($UTF8_ResultBase);

$Data =<<EOF_Data;
<h1>Mountain</h1>
Kilimanjaro<p>
Everest<p>
Mont Blanc<p>
Cerro Aconcagua<p>
Mt.McKinley<p>
Mt. Fuji<p>
Matterhorn<p>
El'brus<p>
Vinson Massif<p>
Kosciusko<p>

<h1>River</h1>
Nile<p>
Rio Amazonas<p>
Mississippi River<p>
Ganga River<p>
The Indus<p>
The Euphrates River<p>
Tigris<p>
Donau<p>
Rhein<p>
Yellow River<p>

<h1>Island</h1>
Greenland<p>
New Guinea<p>
Borneo<p>
Madagascar Island<p>
Sumatra<p>
Great Britain<p>
Java<p>
The Island of Hawai'i<p>
The Island of Maui<p>
O'ahu Island<p>
Kaua'i Island<p>
EOF_Data
################################################
$End_Base =<<EOF_End_Base;
</body>
</html>
EOF_End_Base
chomp($End_Base);

$htaccess =<<'EOF_htaccess';
"<Files \"test_${testNo}_Legacy_$j.html\">
ForceType text/html; charset = $hasharray[$i]{Legacy}
</Files>"
EOF_htaccess

#テストの番号(初期値)
$testNo = 1;

##ディレクトリ作成(Element)
sub mkdir_Element {
	$dirname_Element = "Test_${testNo}_$element_array[$testNo-1]{Element}";
	if(!-d $dirname_Element) {
		#ディレクトリがまだないので、ディレクトリを作成
		mkdir("$dirname_Element", 0755) or die "Can't make directory ->$dirname_Element.:$!\n";
		#0755 ->すべてのユーザがディレクトリに入って読み込みを行えるが、所有者のみが書き込みを行える
	}
	else {
		#ディレクトリがすでに存在する
		print "Directory $dirname_Element already exists.\n";
		print "Files are being overwritten.\n";
		## are all files being owerwritten? some files may have names that are no longer used
		##ファイルはすべて上書きされるか?いくつかのファイルは・・・
	}
}

#ディレクトリ作成(Legacy1)
sub mkdir_Legacy1 {
	$dirname_Legacy1 = "LegacyGroup1_test_$j";
	if(!-d $dirname_Legacy1) {
		#ディレクトリがまだないので、ディレクトリを作成
		mkdir("$dirname_Element/$dirname_Legacy1", 0755) or die "Can't make directory ->$dirname_Legacy1.:$!\n";
		#0755 ->すべてのユーザがディレクトリに入って読み込みを行えるが、所有者のみが書き込みを行える
	}
	else {
		#ディレクトリがすでに存在する
		print "Directory $dirname_Legacy1 already exists.\n";
		print "Files are being overwritten.\n";
	}
}

#ディレクトリ作成(Legacy2)
sub mkdir_Legacy2 {
	$dirname_Legacy2 = "LegacyGroup2_test_$j";
	if(!-d $dirname_Legacy2) {
		#ディレクトリがまだないので、ディレクトリを作成
		mkdir("$dirname_Element/$dirname_Legacy2", 0755) or die "Can't make directory ->$dirname_Legacy2.:$!\n";
		#0755 ->すべてのユーザがディレクトリに入って読み込みを行えるが、所有者のみが書き込みを行える
	}
	else {
		#ディレクトリがすでに存在する
		print "Directory $dirname_Legacy2 already exists.\n";
		print "Files are being overwritten.\n";
	}
}

#ディレクトリ作成(UTF8)
sub mkdir_UTF8 {
	$dirname_UTF8 = "UTF8_test_$j";
	if(!-d $dirname_UTF8) {
		#ディレクトリがまだないので、ディレクトリを作成
		mkdir("$dirname_Element/$dirname_UTF8", 0755) or die "Can't make directory ->$dirname_UTF8.:$!\n";
		#0755 ->すべてのユーザがディレクトリに入って読み込みを行えるが、所有者のみが書き込みを行える
	}
	else {
		#ディレクトリがすでに存在する
		print "Directory $dirname_UTF8 already exists.\n";
		print "Files are being overwritten.\n";
	}
}

##htmlファイルに書き出し
while($testNo <= @element_array) {
#@element_arrayの配列の数だけループ
	&mkdir_Element();
	for($i = 0; $i < @hasharray; $i++) {
		$j = $i+1;
		&mkdir_Legacy1();
		##ファイルをディレクトリに1つずつ出力していく
		##LegacyGroup1の各ディレクトリにテストファイルを出力
		open(F_L1, ">$dirname_Element/$dirname_Legacy1/test_${testNo}_Legacy_$j.html") or
			die "Can't make test_${testNo}_Legacy_$j.html:$!\n";
			
		my $Base1   = eval $Legacy_Base1;
		my $Base2   = eval $Legacy_Base2;
		my $Head    = eval $element_array[$testNo-1]{Head};
		$Head = "" if not defined $Head;
		my $Element = eval $element_array[$testNo-1]{Legacy};
		#myはループを抜けると消える
		print F_L1 <<EOF_Legacy;
$Base1
$Head
$Base2
$Element
$End_Base
EOF_Legacy
		close(F_L1);
		
		
###LegacyGroup1に.htaccessを出力				
		open(F_htaccess1, ">$dirname_Element/$dirname_Legacy1/.htaccess") or 
			die "Can't make .htaccess:$!\n";
		my $HTACCESS = eval $htaccess;
		print F_htaccess1 <<EOF_htaccess1;
$HTACCESS
EOF_htaccess1
		close(F_htaccess1);
#############################		
		
		&mkdir_Legacy2();
		##LegacyGroup2の各ディレクトリにテストファイルを出力
		open(F_L2, ">$dirname_Element/$dirname_Legacy2/test_${testNo}_Legacy_$j.html") or
			die "Can't make test_${testNo}_Legacy_$j.html:$!\n";
		print F_L2 <<EOF_Legacy;
$Base1
$Head
$Base2
$Element
$End_Base
EOF_Legacy
		close(F_L2);

###LegacyGroup2に.htaccessを出力		
		open(F_htaccess2, ">$dirname_Element/$dirname_Legacy2/.htaccess") or 
			die "Can't make .htaccess:$!\n";
		my $HTACCESS = eval $htaccess;
		print F_htaccess2 <<EOF_htaccess2;
$HTACCESS
EOF_htaccess2
		close(F_htaccess2);
#############################
		
###########################################
		&mkdir_UTF8();
		##UTF8の各ディレクトリにテストファイルを出力		
		open(F_U, ">$dirname_Element/$dirname_UTF8/test_${testNo}_UTF8_$j.html") or
			die "Can't make test_${testNo}_UTF8_$j.html:$!\n";
		my $Base1   = eval $UTF8_Base1;
		my $Base2   = eval $UTF8_Base2;
		my $Head    = eval $element_array[$testNo-1]{Head};
		$Head = "" if not defined $Head;
		my $Element = eval $element_array[$testNo-1]{UTF8};
		
		print F_U <<EOF_UTF8;
$Base1
$Head
$Base2
$Element
$End_Base
EOF_UTF8
		close(F_U);
	}
	$testNo++;
}

##LegacyGroup1のtest_1とtest_2にリンク先となるファイルを出力
######LegacyGroup2にももちろん必要だが、とりあえずGroup1だけに作成
######ちなみにLegacyGroup1とLegacyGroup2のファイルの内容はまったく一緒になる
$testNo = 1;

for($i = 0; $i < @hasharray; $i++) {
	$j = $i+1;
	##a_href
	open(F_LegacyResult1, ">Test_1_$element_array[0]{Element}/LegacyGroup1_test_$j/$hasharray[$i]{fnameLegacy}.html") or 
		die "Can't make $hasharray[$i]{fnameLegacy}:$!\n";
	my $Base1         = eval $Legacy_Base1;
	my $Legacy_Result = eval $Legacy_ResultBase;
	print F_LegacyResult1 <<EOF_LegacyResult1;
$Base1
$Legacy_Result
$End_Base
EOF_LegacyResult1
	close(F_LegacyResult1);
	
	##area_href
	copy("./ITEM/fuji.jpg", "./Test_2_$element_array[1]{Element}/LegacyGroup1_test_$j/fuji.jpg") 
		or die "Copy failed: $!";
	open(F_LegacyResult2, ">Test_2_$element_array[1]{Element}/LegacyGroup1_test_$j/$hasharray[$i]{fnameLegacy}.html") or 
		die "Can't make $hasharray[$i]{fnameLegacy}:$!\n";
	print F_LegacyResult2 <<EOF_LegacyResult2;
$Base1
$Legacy_Result
$End_Base
EOF_LegacyResult2
	close(F_LegacyResult2);
	
	##link_href
	open(F_LegacyResult3, ">Test_3_$element_array[2]{Element}/LegacyGroup1_test_$j/$hasharray[$i]{fnameLegacy}.css") or
		die "Can't make $hasharray[$i]{fnameLegacy}.css:$!\n";
	print F_LegacyResult3 <<EOF_LegacyResult3;
body		{text-align:left}
h1			{background-color:#5b94f0;
			color:#ffffff;
			padding:5px}
			
p			{color:#444444}

address		{font-size:smaller;
			color:#444444;
			border-top:solid 8px #5b94f0;
			padding-top:3px}

form		{display: black;
			margin: 1 em 0}
EOF_LegacyResult3

	##img_src
	use File::Copy;	
	copy("./ITEM/okay.GIF", "./Test_4_$element_array[3]{Element}/LegacyGroup1_test_$j/$hasharray[$i]{fnameLegacy}.GIF") 
		or die "Copy failed: $!";
		
	##object_classid
	##.classのURIを多言語にする
	copy("./ITEM/bcqDecoder.class", "./Test_5_$element_array[4]{Element}/LegacyGroup1_test_$j/$hasharray[$i]{fnameLegacy}.class") 
		or die "Copy failed: $!";
	copy("./ITEM/BitSize.class", "./Test_5_$element_array[4]{Element}/LegacyGroup1_test_$j/BitSize.class") 
		or die "Copy failed: $!";
	copy("./ITEM/decoder_level.class", "./Test_5_$element_array[4]{Element}/LegacyGroup1_test_$j/decoder_level.class") 
		or die "Copy failed: $!";
	copy("./ITEM/refresh.class", "./Test_5_$element_array[4]{Element}/LegacyGroup1_test_$j/refresh.class") 
		or die "Copy failed: $!";
	copy("./ITEM/animal1.bcq", "./Test_5_$element_array[4]{Element}/LegacyGroup1_test_$j/animal1.bcq") 
		or die "Copy failed: $!";

############################################################
	##object_codebase
#	open(F_LegacyResult6, ">Test_6_$element_array[5]{Element}/LegacyGroup1_test_$j/baselink.html") or 
#		die "Can't make $hasharray[$i]{fnameLegacy}:$!\n";
#	my $Base1         = eval $Legacy_Base1;
#	my $Legacy_Result = eval $Legacy_ResultBase;
#	print F_LegacyResult6 <<EOF_LegacyResult6;
#$Base1
#$Legacy_Result
#$End_Base
#EOF_LegacyResult6
#	close(F_LegacyResult6);	


	##object_data
	open(F_LegacyResult6, ">Test_6_$element_array[5]{Element}/LegacyGroup1_test_$j/$hasharray[$i]{fnameLegacy}.html") or
		die "Can't make $hasharray[$i]{fnameLegacy}:$!\n";
	print F_LegacyResult6 <<EOF_LegacyResult6;
$Base1
$Data
$End_Base
EOF_LegacyResult6
	close(F_LegacyResult6);
		
	##base_href
	open(F_LegacyResult7, ">Test_7_$element_array[6]{Element}/LegacyGroup1_test_$j/baselink.html") or 
		die "Can't make $hasharray[$i]{fnameLegacy}:$!\n";
	my $Base1         = eval $Legacy_Base1;
	my $Legacy_Result = eval $Legacy_ResultBase;
	print F_LegacyResult7 <<EOF_LegacyResult7;
$Base1
$Legacy_Result
$End_Base
EOF_LegacyResult7
	close(F_LegacyResult7);	
	
	##script_src
	open(F_LegacyResult8, ">Test_8_$element_array[7]{Element}/LegacyGroup1_test_$j/$hasharray[$i]{fnameLegacy}.js") or
		die "Can't make $hasharray[$i]{fnameLegacy}.js:$!\n";
	print F_LegacyResult8 "function win() {window.open('script_src.html','new')}";
	close(F_LegacyResult8);
	
	##form_action
	open(F_LegacyResult9, ">Test_9_$element_array[8]{Element}/LegacyGroup1_test_$j/$hasharray[$i]{fnameLegacy}.html") or 
		die "Can't make $hasharray[$i]{fnameLegacy}:$!\n";
	my $Base1         = eval $Legacy_Base1;
	my $Legacy_Result = eval $Legacy_ResultBase;
	print F_LegacyResult9 <<EOF_LegacyResult9;
$Base1
$Legacy_Result
$End_Base
EOF_LegacyResult9
	close(F_LegacyResult9);
	
	##input_src
	copy("./ITEM/okay.GIF", "./Test_10_$element_array[9]{Element}/LegacyGroup1_test_$j/$hasharray[$i]{fnameLegacy}.GIF") 
		or die "Copy failed: $!";
		
	$testNo++;
}

<?xml version='1.0' encoding='UTF-8'?>
<xsl:transform
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">

	<xsl:output method="html"
				doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
				doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" />

	<xsl:variable name="comma">,</xsl:variable>
	
	<xsl:template match='/'>
		<html>
			<head>
				<title>阿部 裕行 (Hiroyuki Abe) - BibTeX</title>
				<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
				<link rel="stylesheet" href="./css/bibtex.css" type="text/css" media="all" />
			</head>

			<body>
				<h1><a href="./">阿部 裕行 (Hiroyuki Abe)</a> - BibTeX</h1>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="papers">
		<ol><xsl:apply-templates /></ol>
		<!--mode="bibtex" は XML を実際の BibTeX の形式で表示-->
		<xsl:apply-templates select="paper" mode="bibtex" />
	</xsl:template>

	<xsl:template match="paper" mode="bibtex">
		<!--インデントしたいので pre　で。pre なのでここのソースのインデントはむちゃくちゃ見にくい。-->
		<pre>
			<xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute>@<xsl:value-of select="@entry" /> {<xsl:value-of select="@id" />,
<xsl:for-each select="*">
	<xsl:if test="name() != 'abstract'">
		<xsl:text>  </xsl:text>	<!--インデント用-->
		<xsl:if test="name() = 'authors'">author = "</xsl:if>
		<xsl:if test="name() != 'authors'">
		<xsl:value-of select="name()" /> = "</xsl:if><xsl:choose>
			<xsl:when test="@href">
				<a>
					<xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute><xsl:apply-templates />
				</a>
			</xsl:when>
			<xsl:otherwise><xsl:apply-templates mode="bibtex" /></xsl:otherwise>
		</xsl:choose>"<xsl:if test="position() != last()">,</xsl:if><br />
	</xsl:if>
		</xsl:for-each>}
		</pre>
	</xsl:template>

	<xsl:template match="paper">
		<li>
			<a>
				<xsl:attribute name="href">#<xsl:value-of select="@id" /></xsl:attribute>
				<xsl:apply-templates select="authors" />
				<xsl:apply-templates select="title" />
				<xsl:apply-templates select="booktitle" />
				<xsl:apply-templates select="seriese" />
				<xsl:apply-templates select="volume" />
				<xsl:apply-templates select="number" />
				<xsl:apply-templates select="pages" />
				<xsl:apply-templates select="address" />
				<xsl:apply-templates select="howpublished" />
				<xsl:apply-templates select="school" />
				<xsl:apply-templates select="year" />
				<xsl:apply-templates select="month" />.
			</a>
		</li>
	</xsl:template>
	
	<xsl:template match="address"><xsl:apply-templates />, </xsl:template>

	<xsl:template match="authors" mode="bibtex"><xsl:apply-templates select="author" mode="bibtex" /></xsl:template>
	
	<xsl:template match="authors"><xsl:apply-templates />: </xsl:template>

	<xsl:template match="author" mode="bibtex">
		<xsl:choose>
			<!--他のとこでもリンク作るにはこのやり方でできる。-->
			<xsl:when test="@href">
				<a>
					<xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute><xsl:apply-templates />
				</a>
			</xsl:when>
			<xsl:otherwise><xsl:apply-templates /></xsl:otherwise>
		</xsl:choose>
		<!--最後でないのならば and でつなげる-->
		<xsl:if test="position() != last()"> and </xsl:if>
	</xsl:template>

	<xsl:template match="author">
		<xsl:choose>
			<xsl:when test="@href">
				<a>
					<xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute><xsl:apply-templates />
				</a>
			</xsl:when>
			<xsl:otherwise><xsl:apply-templates /></xsl:otherwise>
		</xsl:choose>
		<!--最後でないのならば , でつなげる-->
		<xsl:if test="position() != last()">, </xsl:if>
	</xsl:template>

	<xsl:template match="booktitle"><xsl:apply-templates />, </xsl:template>

	<xsl:template match="chapter"><xsl:apply-templates />, </xsl:template>

	<xsl:template match="edition"><xsl:apply-templates />, </xsl:template>

	<xsl:template match="editor"><xsl:apply-templates />, </xsl:template>

	<xsl:template match="howpublished"><xsl:apply-templates />, </xsl:template>

	<xsl:template match="institution"><xsl:apply-templates />, </xsl:template>

	<xsl:template match="journal"><xsl:apply-templates />, </xsl:template>

	<xsl:template match="key"><xsl:apply-templates />, </xsl:template>

	<xsl:template match="month"><xsl:apply-templates /></xsl:template>

	<xsl:template match="note"><xsl:apply-templates />, </xsl:template>

	<xsl:template match="number">No. <xsl:apply-templates />, </xsl:template>

	<xsl:template match="organaization"><xsl:apply-templates />, </xsl:template>

	<xsl:template match="pages">pp. <xsl:apply-templates />, </xsl:template>

	<xsl:template match="publisher"><xsl:apply-templates />, </xsl:template>

	<xsl:template match="school">
		<xsl:if test="../@entry='mastersthesis'">修士論文, </xsl:if>
		<xsl:apply-templates />, 
	</xsl:template>

	<xsl:template match="series"><xsl:apply-templates />,</xsl:template>
 
	<xsl:template match="title"><xsl:apply-templates />, </xsl:template>

	<xsl:template match="type">, </xsl:template>

	<xsl:template match="volume">Vol. <xsl:apply-templates />, </xsl:template>

	<xsl:template match="year"><xsl:apply-templates />年</xsl:template>
</xsl:transform>
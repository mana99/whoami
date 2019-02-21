<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xhtml" indent="yes" encoding="UTF-8" />

    <xsl:template match="/page">
        <html lang="en">
            <head> 
                <title><xsl:value-of select="contact/name"/></title> 
                <link rel="stylesheet" type="text/css" href="css/fontello.css" />
                <link rel="stylesheet" type="text/css" href="css/style.css" />
                <link rel="stylesheet" type="text/css" media="print" href="css/print-style.css" />
            </head>
            <body>
                <div>
                    <!-- HEADER -->
                    <div id='header'>   
                        <h1><xsl:value-of select="contact/name"/></h1>
                        <h2><xsl:value-of select="contact/title"/></h2>
                    </div>
                    <!-- CONTENTS -->
                    <div id='contents'>
                        <div id='contact' class='section'>
                            <xsl:apply-templates select="contact" />
                        </div>
                        <div id='cover' class='section'>
                            <xsl:copy-of select="cover" />
                        </div>
                        <div id='work' class='section'>
                            <h3>Work Experience</h3>
                            <xsl:apply-templates select="work" />
                        </div>
                        <div id='education' class='section'>
                            <h3>Education</h3>
                            <xsl:apply-templates select="education" />
                        </div>
                    </div>
                    <!-- FOOTER -->
                    <div id='footer'>
                        <span>
                            Page <a href="https://github.com/mana99/whoami" target="_blank">source code</a> released under GNU GPLv3 license.<br />
                            Icons webfont generated with <a href="http://fontello.com">fontello</a> open source project.<br />
                            <a href="http://fortawesome.github.com/Font-Awesome/">Font Awesome</a> Copyright (C) 2016 by Dave Gandy. 
                        </span>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>



    <!-- BOLD -->
    <xsl:template match="b">
        <xsl:element name="b">
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>


    <!-- LINKS --> 
    <xsl:template match="a">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@href"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>


    <!-- CONTACT --> 
    <xsl:template match="contact">
        <div class='photo'>
            <img src="{//photo/@file}" />
        </div>
        <div class='info'>
            <xsl:if test='email'>
                <a href="{email/address/a/@mail}"><span class="logo icon-mail-alt"></span></a>
                <span class="info">    
                    <a href="{//email/address/a/@mail}"><xsl:value-of select="//email/address"/></a> 
                    <xsl:if test='email/pgp'>
                        [<a href="{//email/pgp/a/@href}">pgp</a>]
                    </xsl:if>
                    <br />
                </span>
            </xsl:if>
            <xsl:if test='github'>
                <a href="{github/a/@href}"><span class="logo icon-github"></span></a>
                <span class="info">    
                    <xsl:copy-of select="github" />
                    <br />
                </span>        
            </xsl:if>
            <xsl:if test='reddit'>
                <a href="{reddit/a/@href}"><span class="logo icon-reddit-alien"></span></a>
                <span class="info">    
                    <xsl:copy-of select="reddit" />
                    <br />
                </span>
            </xsl:if>
            <xsl:if test='twitter'>
                <a href="{twitter/a/@href}"><span class="logo icon-twitter"></span></a>
                <span class="info">    
                    <xsl:copy-of select="twitter" />
                    <br />
                </span>
            </xsl:if>
            <xsl:if test='linkedin'>
                <a href="{linkedin/a/@href}"><span class="logo icon-linkedin"></span></a>
                <span class="info">    
                    <xsl:copy-of select="linkedin" />
                    <br />
                </span>
            </xsl:if>            
        </div>
    </xsl:template>

    <!-- WORK -->
    <xsl:template match="work/experience">
        <h4> 
            <xsl:value-of select="@role"/>
        </h4>
        <xsl:if test='company'>
            <xsl:text> at </xsl:text>
            <xsl:copy-of select="company" />
        </xsl:if>
        <xsl:if test='where'>
            <xsl:text> in </xsl:text>
            <xsl:copy-of select="where" />
        </xsl:if>
        <xsl:if test='when'>
            <xsl:text>, </xsl:text> 
            <xsl:value-of select="when"/>
        </xsl:if>
        <xsl:if test='job'>
            <ul><xsl:apply-templates select="job"/></ul>
        </xsl:if>
    </xsl:template>

    <xsl:template match="job/li">
        <xsl:copy-of select="." />
    </xsl:template>


    <!-- EDUCATION -->
    <xsl:template match="education/course">
        <h4> 
            <xsl:value-of select="@title"/> 

        </h4>
        <xsl:choose>
            <!-- COURSE -->
            <xsl:when test="@type='course'">
                <xsl:if test='who'>
                    <xsl:text>by </xsl:text> 
                    <xsl:copy-of select="who" />
                </xsl:if>
                <xsl:if test='where'>
                    <xsl:text> @ </xsl:text>
                    <xsl:copy-of select="where" />
                </xsl:if>
                <xsl:if test='via'>
                    <xsl:text> via </xsl:text> 
                    <xsl:copy-of select="via" />
                </xsl:if>
                <xsl:if test='when'>
                    <xsl:text>, </xsl:text> 
                    <xsl:value-of select="when"/>
                </xsl:if>
                <xsl:if test='cert'>
                    [<a href="{cert/a/@href}">cert</a>]
                </xsl:if>
            </xsl:when>
            <!-- DEGREE -->
            <xsl:otherwise>
                <xsl:if test='where'>
                    <xsl:copy-of select="where" />
                </xsl:if>
                <xsl:if test='via'> 
                    <xsl:text> via </xsl:text> 
                    <xsl:copy-of select="via" />
                </xsl:if>
                <xsl:if test='when'>
                    <xsl:text>, </xsl:text> 
                    <xsl:value-of select="when"/>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test='syllabus'>
            <ul><xsl:apply-templates select="syllabus"/></ul>
        </xsl:if>
    </xsl:template>

    <xsl:template match="syllabus/li">
        <xsl:copy-of select="." />
    </xsl:template>

</xsl:stylesheet>



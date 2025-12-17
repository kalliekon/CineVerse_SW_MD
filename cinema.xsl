<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/cinema">
		<html>
			<head>
				<meta charset="UTF-8"/>
				<title>CineVerse</title>
				<style>
                body {
                    margin: 0;
                    padding: 0;
                    font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Arial, sans-serif;
                    background: #050608;
                    color: #f5f5f5;
                }
                .mainPage {
                    max-width: 1100px;
                    margin: 0 auto;
                    padding: 32px 16px 40px 16px;
                }
                h1 {
                    text-align: center;
                    font-size: 2.2rem;
                    margin-bottom: 4px;
                    letter-spacing: 0.08em;
                    text-transform: uppercase;
                    color: #e3e6ff;
                }
                .subtitle {
                    text-align: center;
                    font-size: 0.95rem;
                    color: #9da3c3;
                    margin-bottom: 30px;
                }
                h2 {
                    margin-top: 32px;
                    margin-bottom: 14px;
                    font-size: 1.5rem;
                    color: #f0f2ff;
                    border-bottom: 1px solid #30344a;
                    padding-bottom: 4px;
                }
                .sectionSubtitle {
                    font-size: 0.85rem;
                    color: #9da3c3;
                    margin-bottom: 12px;
                }
                .mainBox {
                    background: linear-gradient(135deg, #181b24 0%, #111318 100%);
                    border-radius: 14px;
                    margin-bottom: 16px;
                    padding: 14px 16px;
                    box-shadow: 0 12px 24px rgba(0,0,0,0.35);
                    border: 1px solid #252838;
                }
                .boxHeader {
                    display: flex;
                    flex-wrap: wrap;
                    justify-content: space-between;
                    align-items: baseline;
                    gap: 6px;
                    margin-bottom: 4px;
                }
                .boxTitle {
                    font-size: 1.1rem;
                    font-weight: 600;
                }
                .lineOne {
                    font-size: 0.82rem;
                    color: #c4c8e6;
                    margin-top: 2px;
                }
                .smallLabel {
                    font-weight: 600;
                    color: #e3e6ff;
                    font-size: 0.82rem;
                }
                .lineTwo{
                    margin-top: 6px;
                    margin-bottom: 4px;
                }
                .boxLineTwo {
                    display: inline-block;
                    background: #23273a;
                    color: #c4c8e6;
                    border-radius: 999px;
                    padding: 2px 10px;
                    font-size: 0.78rem;
                    margin-right: 5px;
                    margin-bottom: 4px;
                }
                .bioText,
                .descText {
                    font-size: 0.88rem;
                    color: #d0d3ea;
                    line-height: 1.4;
                    margin-top: 4px;
                    margin-bottom: 4px;
                }
                .list {
                    font-size: 0.84rem;
                    color: #cfd2ef;
                    margin-top: 4px;
                }
                .listItem {
                    margin-bottom: 2px;
                }
                .posterBox {
                    float: right;
                    max-width: 150px;
                    margin-left: 14px;
                    margin-bottom: 8px;
                }
                .posterBox img {
                    width: 100%;
                    border-radius: 10px;
                    border: 1px solid #3a3f5c;
                    display: block;
                }
                .castList {
                    font-size: 0.84rem;
                    color: #cfd2ef;
                    margin-top: 4px;
                }
                .castBox {
                    margin-bottom: 3px;
                }
                .roleTag {
                    text-transform: uppercase;
                    font-size: 0.7rem;
                    background: #304ffe;
                    color: #ffffff;
                    border-radius: 999px;
                    padding: 1px 7px;
                    margin-right: 5px;
                }
                .statusClass {
                    font-size: 0.75rem;
                    color: #ffcc80;
                    margin-left: 6px;
                }
                .links a {
                    font-size: 0.84rem;
                    color: #80d8ff;
                    text-decoration: none;
                    margin-right: 10px;
                }
                .links a:hover {
                    text-decoration: underline;
                }
                }
            </style>
			</head>
			<body>
				<div class="mainPage">
					<h1>CineVerse</h1>
					<div class="subtitle">
                    Welcome fellow cinephiles to my Cinema database and learn about your favorite movies, directors, actors and awards!
                </div>
					<h2>Directors</h2>
					<div class="sectionSubtitle">
                    This section presents all directors in alphabetical order, including their biographical data, status, awards and the movies they directed.
                </div>
					<xsl:apply-templates select="directors/director" mode="directorMode">
						<xsl:sort select="name" order="ascending"/>
					</xsl:apply-templates>
					<h2>Movies</h2>
					<div class="sectionSubtitle">
                    This section shows all movies in alphabetical order, including genres, production companies, cast, box office data, posters and external links.
                </div>
					<xsl:apply-templates select="movies/movie" mode="movieMode">
						<xsl:sort select="title" order="ascending"/>
					</xsl:apply-templates>
					<h2>Awards</h2>
					<div class="sectionSubtitle">
                    This section lists all awards in alphabetical order, along with their title, organization, category, year and, when necessary, the related work.
                </div>
					<xsl:apply-templates select="awards/award" mode="awardMode">
						<xsl:sort select="awardTitle" order="ascending"/>
					</xsl:apply-templates>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="director" mode="directorMode">
		<div class="mainBox">
			<div class="boxHeader">
				<div class="boxTitle">
					<xsl:value-of select="name"/>
					<xsl:if test="@status">
						<span class="statusClass">
							<xsl:text>[</xsl:text>
							<xsl:value-of select="@status"/>
							<xsl:text>]</xsl:text>
						</span>
					</xsl:if>
				</div>
			</div>
			<div class="lineOne">
				<span class="smallLabel">Lifespan:</span>
				<xsl:text> </xsl:text>
				<xsl:choose>
					<xsl:when test="birthDate and deathYear">
						<xsl:value-of select="birthDate"/>
						<xsl:text> – </xsl:text>
						<xsl:value-of select="deathYear"/>
					</xsl:when>
					<xsl:when test="birthDate">
						<xsl:value-of select="birthDate"/>
						<xsl:text> – present</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>not specified</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<div class="lineTwo">
				<span class="smallLabel">Nationality:</span>
				<xsl:text> </xsl:text>
				<xsl:choose>
					<xsl:when test="nationality">
						<xsl:for-each select="nationality">
							<span class="boxLineTwo">
								<xsl:value-of select="."/>
							</span>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<span class="boxLineTwo">not specified</span>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<xsl:if test="bio">
				<div class="smallLabel">Biography:</div>
				<div class="bioText">
					<xsl:value-of select="bio"/>
				</div>
			</xsl:if>
			<xsl:if test="awardsRef">
				<xsl:variable name="refs" select="awardsRef/@refs"/>
				<xsl:variable name="awardCount" select="count(/cinema/awards/award[contains(concat(' ', $refs, ' '), concat(' ', @id, ' '))])"/>
				<div class="smallLabel">
					<xsl:text>Awards (in total </xsl:text>
					<xsl:value-of select="$awardCount"/>
					<xsl:text>)</xsl:text>
				</div>
				<div class="list">
					<xsl:for-each select="/cinema/awards/award[contains(concat(' ', $refs, ' '), concat(' ', @id, ' '))]">
						<div class="listItem">
							<xsl:value-of select="awardTitle"/>
							<xsl:text> – </xsl:text>
							<xsl:value-of select="awardCategory"/>
							<xsl:text> (</xsl:text>
							<xsl:value-of select="awardYear"/>
							<xsl:text>)</xsl:text>
							<xsl:if test="awardWork">
								<xsl:text>, for </xsl:text>
								<xsl:value-of select="awardWork"/>
							</xsl:if>
						</div>
					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:variable name="movieCount" select="count(/cinema/movies/movie[@directorRef = current()/@id])"/>
			<div class="smallLabel" style="margin-top:6px;">
				<xsl:text>Movies directed (in total </xsl:text>
				<xsl:value-of select="$movieCount"/>
				<xsl:text>)</xsl:text>
			</div>
			<div class="list">
				<xsl:for-each select="/cinema/movies/movie[@directorRef = current()/@id]">
					<xsl:sort select="year" order="ascending"/>
					<div class="listItem">
						<xsl:value-of select="title"/>
						<xsl:text> (</xsl:text>
						<xsl:value-of select="year"/>
						<xsl:text>)</xsl:text>
					</div>
				</xsl:for-each>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="movie" mode="movieMode">
		<div class="mainBox">
			<xsl:variable name="directorId" select="@directorRef"/>
			<xsl:variable name="director" select="/cinema/directors/director[@id=$directorId]"/>
			<xsl:if test="poster">
				<div class="posterBox">
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="poster/@url"/>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="concat('Poster of ', title)"/>
						</xsl:attribute>
					</img>
				</div>
			</xsl:if>
			<div class="boxHeader">
				<div class="boxTitle">
					<xsl:value-of select="title"/>
				</div>
			</div>
			<div class="lineOne">
				<span class="smallLabel">Year:</span>
				<xsl:text> </xsl:text>
				<xsl:value-of select="year"/>
				<xsl:text> · </xsl:text>
				<span class="smallLabel">Duration:</span>
				<xsl:text> </xsl:text>
				<xsl:value-of select="duration"/>
			</div>
			<div class="lineOne">
				<span class="smallLabel">Director:</span>
				<xsl:text> </xsl:text>
				<xsl:value-of select="$director/name"/>
			</div>
			<div class="lineTwo">
				<span class="smallLabel">Production:</span>
				<xsl:text> </xsl:text>
				<xsl:for-each select="production">
					<span class="boxLineTwo">
						<xsl:value-of select="."/>
					</span>
				</xsl:for-each>
			</div>
			<div class="lineTwo">
				<span class="smallLabel">Genres:</span>
				<xsl:text> </xsl:text>
				<xsl:for-each select="genres/genre">
					<xsl:sort select="." order="ascending"/>
					<span class="boxLineTwo">
						<xsl:value-of select="."/>
					</span>
				</xsl:for-each>
			</div>
			<xsl:if test="description">
				<div class="smallLabel">Description:</div>
				<div class="descText">
					<xsl:value-of select="normalize-space(description)"/>
				</div>
			</xsl:if>
			<div class="smallLabel">Cast:</div>
			<div class="castList">
				<xsl:for-each select="actors/actor">
					<xsl:sort select="@roleType" order="ascending"/>
					<xsl:sort select="actorName" order="ascending"/>
					<div class="castBox">
						<xsl:if test="@roleType">
							<span class="roleTag">
								<xsl:value-of select="@roleType"/>
							</span>
						</xsl:if>
						<xsl:value-of select="actorName"/>
						<xsl:text> as </xsl:text>
						<xsl:value-of select="characterName"/>
						<xsl:if test="@status">
							<span class="statusClass">
								<xsl:text>[</xsl:text>
								<xsl:value-of select="@status"/>
								<xsl:text>]</xsl:text>
							</span>
						</xsl:if>
						<xsl:if test="actorBirthDate or actorDeathYear">
							<xsl:text> (</xsl:text>
							<xsl:if test="actorBirthDate">
								<xsl:text>born </xsl:text>
								<xsl:value-of select="actorBirthDate"/>
							</xsl:if>
							<xsl:if test="actorDeathYear">
								<xsl:if test="actorBirthDate">
									<xsl:text>, died </xsl:text>
								</xsl:if>
								<xsl:if test="not(actorBirthDate)">
									<xsl:text>died </xsl:text>
								</xsl:if>
								<xsl:value-of select="actorDeathYear"/>
							</xsl:if>
							<xsl:text>)</xsl:text>
						</xsl:if>
						<xsl:if test="actorNationality">
							<xsl:text> – </xsl:text>
							<xsl:for-each select="actorNationality">
								<xsl:value-of select="."/>
								<xsl:if test="position() != last()">
									<xsl:text>/</xsl:text>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</div>
				</xsl:for-each>
			</div>
			<xsl:if test="boxOffice">
				<div class="lineOne" style="margin-top:4px;">
					<span class="smallLabel">Box office:</span>
					<xsl:if test="boxOffice/budget">
						<xsl:text> Budget: </xsl:text>
						<xsl:value-of select="boxOffice/budget"/>
					</xsl:if>
					<xsl:if test="boxOffice/revenue">
						<xsl:text> · Revenue: </xsl:text>
						<xsl:value-of select="boxOffice/revenue"/>
					</xsl:if>
				</div>
			</xsl:if>
			<div class="links" style="margin-top:6px;">
				<span class="smallLabel">Links:</span>
				<xsl:text> </xsl:text>
				<xsl:if test="link/imdb">
					<a>
                        <xsl:attribute name="href">
							<xsl:value-of select="link/imdb/@href"/>
						</xsl:attribute>
                        IMDb
                    </a>
				</xsl:if>
				<xsl:if test="link/youtube">
					<a>
                        <xsl:attribute name="href">
							<xsl:value-of select="link/youtube/@href"/>
						</xsl:attribute>
                        Trailer
                    </a>
				</xsl:if>
			</div>
			<div style="clear: both;"/>
		</div>
	</xsl:template>
	<xsl:template match="award" mode="awardMode">
		<div class="mainBox">
			<div class="boxHeader">
				<div class="boxTitle">
					<xsl:value-of select="awardTitle"/>
				</div>
			</div>
			<div class="lineOne">
				<span class="smallLabel">Organization:</span>
				<xsl:text> </xsl:text>
				<xsl:value-of select="awardOrganization"/>
			</div>
			<div class="lineOne">
				<span class="smallLabel">Category:</span>
				<xsl:text> </xsl:text>
				<xsl:value-of select="awardCategory"/>
				<xsl:text> · </xsl:text>
				<span class="smallLabel">Year:</span>
				<xsl:text> </xsl:text>
				<xsl:value-of select="awardYear"/>
			</div>
			<xsl:if test="awardWork">
				<div class="lineOne">
					<span class="smallLabel">Work:</span>
					<xsl:text> </xsl:text>
					<xsl:value-of select="awardWork"/>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
</xsl:stylesheet>
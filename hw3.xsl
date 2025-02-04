<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />
  <xsl:template match="/">
    <html>
      <head>
        <title>List of Clients</title>
        <style>
          table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
          }
          th, td {
            border: 1px solid #000;
            padding: 10px;
            text-align: left;
          }
          th {
            background-color: #f2f2f2;
          }
          .right-align {
            text-align: right;
          }
          .low-value {
            color: red;
            font-weight: bold;
          }
        </style>
      </head>
      <body>
        <h1>List of Clients</h1>
        <table>
          <tr>
            <th>Name</th>
            <th>Phone</th>
            <th>Email</th>
            <th class="right-align">Account Total</th>
          </tr>
          <xsl:for-each select="clients/client">
            <tr>
              <td><xsl:value-of select="name" /></td>
              <td><xsl:value-of select="phone" /></td>
              <td><xsl:value-of select="email" /></td>
              <td class="right-align">
                <xsl:choose>
                  <xsl:when test="account_total &lt;= 80000">
                    <span class="low-value">$<xsl:value-of select="account_total" /></span>
                  </xsl:when>
                  <xsl:otherwise>
                    $<xsl:value-of select="account_total" />
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
                doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>
        <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
            <head>
                <title>Devices</title>
            </head>
            <body style="background-color:#0c2419; color:#FFFFFF">
                <h1>Devices - Spis urządzeń elektrycznych</h1>
                <table border="3" style="width:100%; border-color:#007fff">
                    <caption><b>Spis urządzeń elektrycznych</b></caption>
                    <tr>
                        <th>Brand i Model</th>
                        <th>Technikalia</th>
                        <th>Typ systemu</th>
                        <th>Procesor</th>
                        <th>Wielkość baterii</th>
                        <th>Rating</th>
                        <th>Wymiary</th>
                    </tr>
                    <xsl:for-each select="Dokument/Device">
                        <tr align="center">
                            <td ><xsl:value-of select="@Brand_and_model"/></td>
                            <td ><xsl:value-of select="@Technical"/></td>
                            <td ><xsl:value-of select="@System"/></td>
                            <td ><xsl:value-of select="@Procesor"/></td>
                            <td ><xsl:value-of select="@Battery"/></td>
                            <td ><xsl:value-of select="@Rating"/></td>
                            <td ><xsl:value-of select="@Dimensions"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <p></p>
                <table border="3" style="width:100%; border-color:#007fff">
                    <caption style="size:150px;"><b>Statystyki</b></caption>
                    <tr align="center">
                        <th>Ilość urzadzeń elektrycznych</th>
                        <th>Średnia ilość ramu</th>
                        <th>Średnia wielkość baterii</th>
                        <th>Urządzenia z portem USB B</th>
                        <th>Urządzenia z portem USB C</th>
                    </tr>
                    <tr align="center">
                        <td ><xsl:value-of select="Dokument/Statystyki/numberOfDevices"/></td>
                        <td ><xsl:value-of select="Dokument/Statystyki/Average_Phone_Ram"/></td>
                        <td ><xsl:value-of select="Dokument/Statystyki/Average_batteryCapacity"/></td>
                        <td ><xsl:value-of select="Dokument/Statystyki/Devices_Port_USB_B"/></td>
                        <td ><xsl:value-of select="Dokument/Statystyki/Devices_Port_USB_C"/></td>
                    </tr>
                    <tr>
                        <th>Smartphone</th>
                        <th>Tablet-Phone</th>
                        <th>Laptop</th>
                    </tr>
                    <tr align="center">
                        <td ><xsl:value-of select="Dokument/Statystyki/Devices_Body_Smartphone"/></td>
                        <td ><xsl:value-of select="Dokument/Statystyki/Devices_Body_Tablet-Phone"/></td>
                        <td ><xsl:value-of select="Dokument/Statystyki/Devices_Body_Laptop"/></td>
                    </tr>
                </table>
            </body>
        </html>
        </xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:text>|     Brand i Model      |             Technikalia          |   Typ systemu   |      Procesor     |   Wielkosc baterii  |      Rating       |                 Wymiary                    |</xsl:text>
        <xsl:text>&#xA;</xsl:text>
        <xsl:text>__________________________________________________________________________________________________________________________________________________________________________</xsl:text>
        <xsl:text>&#xA;</xsl:text>

        <xsl:for-each select="Dokument/Device">
            <xsl:value-of
                    select="concat(@Brand_and_model,substring('                  ',1,25-string-length(@Brand_and_model)),' ',@Technical,substring(' ',1,37-string-length(@Technical)),' ',
                    @ System,substring('   ',1,7-string-length(@System)),'      ',@Procesor,substring('   ',1,12-string-length(@Procesor)),'           ',@Battery,'                 ',
                    @Rating,'             ',@Dimensions)"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text>--------------------------------------------------------------------------------------------------------------------------------------------------------------------------</xsl:text>
            <xsl:text>&#xA;</xsl:text>
        </xsl:for-each>

        <xsl:text>&#xA;Statystyki &#xA;</xsl:text>
        <xsl:text>Ilość urządzeń elektronicznych: </xsl:text><xsl:value-of
            select="Dokument/Statystyki/numberOfDevices"/><xsl:text>&#xA;</xsl:text>
        <xsl:text>Średnia ilość ramu w urządzeniach: </xsl:text><xsl:value-of
            select="Dokument/Statystyki/Average_Phone_Ram"/><xsl:text>&#xA;</xsl:text>
        <xsl:text>Średnia wielkość baterii </xsl:text><xsl:value-of
            select="Dokument/Statystyki/Average_batteryCapacity"/><xsl:text>&#xA;</xsl:text>
        <xsl:text>Urządzenia z portem USB B: </xsl:text><xsl:value-of
            select="Dokument/Statystyki/Devices_Port_USB_B"/><xsl:text>&#xA;</xsl:text>
        <xsl:text>Urządzenia z portem USB C: </xsl:text><xsl:value-of
            select="Dokument/Statystyki/Devices_Port_USB_C"/><xsl:text>&#xA;</xsl:text>
        <xsl:text>Liczba urządzeń typu Smartphone: </xsl:text><xsl:value-of
            select="Dokument/Statystyki/Devices_Body_Smartphone"/><xsl:text>&#xA;</xsl:text>
        <xsl:text>Liczba urządzeń typu Tablet-Phone: </xsl:text><xsl:value-of
            select="Dokument/Statystyki/Devices_Body_Tablet-Phone"/><xsl:text>&#xA;</xsl:text>
        <xsl:text>Liczba urządzeń typu Laptop: </xsl:text><xsl:value-of
            select="Dokument/Statystyki/Devices_Body_Laptop"/><xsl:text>&#xA;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
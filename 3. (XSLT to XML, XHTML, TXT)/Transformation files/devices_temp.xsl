<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
    <xsl:element name="Dokument">
        <xsl:apply-templates select="dokument/devices"/>
        <xsl:element name="Statystyki">
            <xsl:element name="numberOfDevices">
                    <xsl:value-of select="count(dokument/devices/device)"/>
            </xsl:element>
            <xsl:element name="Devices_Body_Smartphone">
                    <xsl:value-of select="count(dokument/devices/device/bodyStyle[@name='Smartphone'])"/>
            </xsl:element>
            <xsl:element name="Devices_Body_Tablet-Phone">
                    <xsl:value-of select="count(dokument/devices/device/bodyStyle[@name='Tablet-Phone'])"/>
            </xsl:element>
            <xsl:element name="Devices_Body_Laptop">
                    <xsl:value-of select="count(dokument/devices/device/bodyStyle[@name='Laptop'])"/>
            </xsl:element>
            <xsl:element name="Average_Phone_Ram">
                    <xsl:value-of
                            select="sum(dokument/devices/device/technical/ram) div count(dokument/devices/device)"/>
            </xsl:element>
            <xsl:element name="Average_batteryCapacity">
                    <xsl:value-of
                            select="sum(dokument/devices/device/batteryCapacity) div count(dokument/devices/device)"/>
            </xsl:element>
            <xsl:element name="Devices_Port_USB_B">
                    <xsl:value-of
                            select="count(dokument/devices/device/technical[port='USB typ B'])"/>
            </xsl:element>
            <xsl:element name="Devices_Port_USB_C">
                    <xsl:value-of
                            select="count(dokument/devices/device/technical[port='USB typ C'])"/>
            </xsl:element>
    </xsl:element>
    </xsl:element>
</xsl:template>
<xsl:template match="dokument/devices">
    <xsl:for-each select="device">
         <xsl:sort select="ocena" order="descending"/>
         <xsl:element name="Device">
              <xsl:attribute name="Rating">
                    <xsl:value-of select="rating"/>
              </xsl:attribute>
              <xsl:attribute name="Brand_and_model">
                    <xsl:value-of select="concat(brand/@bname,' ',model)"/>
              </xsl:attribute>
              <xsl:choose>
                    <xsl:when test="string(@name) = 'Smartphone'">
                        <xsl:attribute name="Body">Smartphone</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@name) = 'Tablet-Phone'">
                        <xsl:attribute name="Body">Tablet-Phone</xsl:attribute>
                    </xsl:when>
                     <xsl:when test="string(@name) = 'Laptop'">
                        <xsl:attribute name="Body">Laptop</xsl:attribute>
                    </xsl:when>
                </xsl:choose>
                 <xsl:attribute name="Technical">
                    <xsl:value-of
                            select="concat('RAM [GB]: ',technical/ram,' ','builtInMemory [GB]: ', technical/builtInMemory)"/>
                </xsl:attribute>
                <xsl:attribute name="System">
                    <xsl:value-of select="technical/typeOfSystem"/>
                </xsl:attribute>
                <xsl:attribute name="Procesor">
                    <xsl:value-of select="technical/procesor"/>
                </xsl:attribute>
                <xsl:attribute name="Dimensions">
                    <xsl:value-of
                            select="concat('Display: ',dimensions/display,' ',dimensions/display/@unit, ' Thickness: ',dimensions/thickness,' ',dimensions/thickness/@unit)"/>
                </xsl:attribute>
                <xsl:attribute name="Battery">
                    <xsl:value-of select="batteryCapacity"/>
                </xsl:attribute>
         </xsl:element>
    </xsl:for-each>
   </xsl:template>
</xsl:stylesheet>
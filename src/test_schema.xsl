<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="url" type="xs:string"/>
    <xs:element name="operations">
        <xs:complexType>
            <xs:sequence>
                <xs:element name="operation" minOccurs="1" maxOccurs="unbounded">
                    <xs:complexType>
                        <xs:attribute name="name" use="required">
                            <xs:simpleType>
                                <xs:restriction base="xs:string">
                                    <xs:enumeration value="Click"/>
                                    <xs:enumeration value="KeyboardInput"/>
                                    <xs:enumeration value="WaitAppearRepeatedly"/>
                                    <xs:enumeration value="WaitDisappearRepeatedly"/>
                                    <xs:enumeration value="SelectDropDown"/>
                                    <xs:enumeration value="WaitInvisible"/>
                                    <xs:enumeration value="SelectCheckBox"/>
                                    <xs:enumeration value="ClickIfAnotherElementExist"/>
                                </xs:restriction>
                            </xs:simpleType>
                        </xs:attribute>
                        <xs:attribute name="xpath" type="xs:string" use="required"/>
                        <xs:attribute name="value" type="xs:string" use="optional"/>
                        <xs:attribute name="group" use="optional">
                            <xs:simpleType>
                                <xs:restriction base="xs:integer">
                                    <xs:minInclusive value="1"/>
                                </xs:restriction>
                            </xs:simpleType>
                        </xs:attribute>
                        <xs:attribute name="select-index" type="xs:unsignedInt" use="optional"/>
                        <xs:attribute name="customize-refresh-xpath" type="xs:string" use="optional"/>
                        <xs:attribute name="dynamic-time-stamp" type="xs:boolean" use="optional"/>
                        <xs:attribute name="select" type="xs:boolean" use="optional"/>
			<xs:attribute name="relative-path" type="xs:boolean" use="optional"/>
                        <xs:anyAttribute/>
                    </xs:complexType>
                </xs:element>
            </xs:sequence>
            <xs:attribute name="group" use="optional">
                <xs:simpleType>
                    <xs:restriction base="xs:integer">
                        <xs:minInclusive value="1"/>
                    </xs:restriction>
                </xs:simpleType>
            </xs:attribute>
        </xs:complexType>
    </xs:element>

    <xs:element name="spec">
        <xs:complexType>
            <xs:attribute name="name" type="xs:string" use="required"/>
            <xs:attribute name="value" type="xs:string" use="required"/>
        </xs:complexType>
    </xs:element>

    <xs:element name="testcase">
        <xs:complexType>
            <xs:sequence>
                <xs:element ref="operations" minOccurs="1" maxOccurs="unbounded"/>
            </xs:sequence>
            <xs:attribute name="name" type="xs:string" use="required"/>
            <xs:attribute name="require-vm-state" use="required">
                <xs:simpleType>
                    <xs:restriction base="xs:string">
                        <xs:pattern value="[\d]+-[\d]+-[\d]+-[\d]"/>
                    </xs:restriction>
                </xs:simpleType>
            </xs:attribute>
            <xs:attribute name="group-count" use="optional">
                <xs:simpleType>
                    <xs:restriction base="xs:int">
                        <xs:minInclusive value="1"/>
                    </xs:restriction>
                </xs:simpleType>
            </xs:attribute>
        </xs:complexType>
    </xs:element>

    <xs:element name="config">
        <xs:complexType>
            <xs:all>
                <xs:element name="max-vm-per-page" type="xs:unsignedInt"/>
                <xs:element name="language-to-run" type="xs:unsignedInt"/>
                <xs:element name="wait-refresh-interval" type="xs:unsignedInt"/>
                <xs:element name="use-simple-wait" type="xs:boolean"/>
                <xs:element name="simple-wait-time" type="xs:unsignedInt"/>
                <xs:element name="test-to-run">
                    <xs:complexType>
                        <xs:sequence>
                            <xs:element name="test" minOccurs="1" maxOccurs="unbounded"/>
                        </xs:sequence>
                    </xs:complexType>
                </xs:element>

                <xs:element name="webdriver">
                    <xs:complexType>
                        <xs:all>
                            <xs:element name="name" type="xs:string"/>
                            <xs:element name="specs">
                                <xs:complexType>
                                    <xs:sequence>
                                        <xs:element maxOccurs="unbounded" ref="spec"/>
                                    </xs:sequence>
                                </xs:complexType>
                            </xs:element>
                        </xs:all>
                    </xs:complexType>
                </xs:element>

                <xs:element name="login">
                    <xs:complexType>
                        <xs:all>
                            <xs:element ref="url"/>
                            <xs:element ref="operations"/>
                        </xs:all>
                    </xs:complexType>
                </xs:element>

                <xs:element name="monitor-wait">
                    <xs:complexType>
                        <xs:all>
                            <xs:element ref="url"/>
                            <xs:element ref="operations"/>
                        </xs:all>
                    </xs:complexType>
                </xs:element>

                <xs:element name="testcases">
                    <xs:complexType>
                        <xs:sequence>
                            <xs:element ref="testcase" maxOccurs="unbounded"/>
                        </xs:sequence>
                    </xs:complexType>
                </xs:element>

            </xs:all>
        </xs:complexType>
    </xs:element>
</xs:schema>

<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <outboundMessages>
        <fullName>policycc</fullName>
        <apiVersion>35.0</apiVersion>
        <endpointUrl>http://gmail.com</endpointUrl>
        <fields>CreatedById</fields>
        <fields>CreatedDate</fields>
        <fields>Id</fields>
        <fields>IsDeleted</fields>
        <fields>LastActivityDate</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>amar01@gmail.com</integrationUser>
        <name>policycc</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>PolicyCreate</fullName>
        <actions>
            <name>policycc</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>tfe_policy__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
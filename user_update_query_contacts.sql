SELECT
  Department,
  Division__c,
  ReportsTo.Salesforce_User__c,
  Salesforce_User__c,
  Supervisor_per_Location__r.Salesforce_User__c,
  Title
FROM
  Contact
WHERE
  Employment_Status__c = 'Active'
  AND Department Like '%bay%'
  AND Salesforce_User__c !=null

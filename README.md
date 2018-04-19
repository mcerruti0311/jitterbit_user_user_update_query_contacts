# Jitterbit User Update Query Contacts
User Update Query Contacts - Updates User Records from the Contact

This operation should be run when a new Director replaces an existing director.

Example: Steve Perry replaces Jerry Tidwell
This should be done after the Supervisor per Location has been updated to the
new director.

### User Update Query Contacts

The Jitterbit operation `User Update Query Contacts` queries Contacts to create
a file to be used by the update operation `Update Users From Contacts`.
The following example queries Contacts for eBay. 

``` sql
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
```

The output file is placed on the mft.sis.us SFTP server in the path:
`/user/user_from_contact`

the file name is `users_to_update.csv`

On successful completion the operation calls the operation
`Update Users From Contacts`.

### Update Users From Contacts

Using the source file comes directly from the target file created by the
operation `User Update Query Contacts`.

The transformation file updates the following `User` fields:
* Department
* Director
* Division
* Manager
* Title

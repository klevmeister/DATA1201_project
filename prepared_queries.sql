--Created by: Chinonso Unegbu, Ethan Waugh, Johnny Tsan, Matt Johnson

-- Q1: Uses the OwnerContactInfo view to filter and present important information regarding reaching out to owners for leasing. This view obscures information that is either irrelevant to a frontend user (IDs) or sensitive (passwords, other coworkers)

/*  SQL throws errors when a view is being created and then selected in the same query. Please run the file 'prepared_views.sql' before executing this file.

IF OBJECT_ID('OwnerContactInfo', 'V') IS NOT NULL
    DROP VIEW OwnerContactInfo;
GO

CREATE VIEW OwnerContactInfo AS
SELECT
    u.UserID,
    u.FirstName,
    u.LastName,
    u.PhoneNumber,
    u.Email,
    ur.Name AS UserRole
FROM [User] u
INNER JOIN [UserRole] ur
    ON u.UserRole = ur.TypeID
WHERE ur.Name = 'Owner';
GO */

SELECT * FROM [OwnerContactInfo];
GO

-- Q2: Uses ViewWorkspaceDetails to pull important information about a workspace for coworker to review. Obscures fields meant for the owner

/* IF OBJECT_ID('ViewWorkspaceDetails', 'V') IS NOT NULL
    DROP VIEW ViewWorkspaceDetails;
GO

CREATE VIEW ViewWorkspaceDetails AS
SELECT
    w.WorkspaceID,
    w.Name,
    s.Name AS SpaceType,
    w.Seating,
    w.DailyPrice
FROM [Workspace] w
INNER JOIN [SpaceType] s
    ON w.Type = s.TypeID;
GO */

SELECT * FROM [ViewWorkspaceDetails];
GO

-- Q3: Uses ViewLocationOwners to show the names of every owner that owns a location.
/*CREATE VIEW ViewLocationOwners AS
SELECT 
    u.FirstName, 
    u.LastName, 
    l.Name, 
    l.City, 
    l.Province, 
    l.Street, 
    l.PostalCode
FROM [Location] l
INNER JOIN [User] u
    ON u.UserID = l.Owner
GO */

SELECT * FROM [ViewLocationOwners];
GO

-- Q4: Filters locations by city name and parking access, then sorts by the area of the property in descending order.
SELECT Name, City, Area_m2
FROM [Location]
WHERE City = 'Calgary'
  AND Parking = 1
ORDER BY Area_m2 DESC;

-- Q5: Filters locations by province
SELECT Name, City, Province
FROM [Location]
WHERE Province = 2;

-- Q6: Selects owners who have a phone number
SELECT FirstName, LastName, PhoneNumber
FROM [User]
WHERE PhoneNumber IS NOT NULL;

-- Q7: Selects owners who have an email
SELECT FirstName, LastName, Email
FROM [User]
WHERE Email IS NOT NULL;

-- Q7: Selects workspaces which have listed lease prices
SELECT Name, Type, DailyPrice
FROM [Workspace]
WHERE DailyPrice IS NOT NULL;

-- Q8: Selects workspaces with a seating of 5 or greater
SELECT Name, Type, Seating
FROM [Workspace]
WHERE Seating >= 5;

-- Q9: Selects workspaces that are offices
SELECT Name, Type
FROM [Workspace]
WHERE Type = 1;

-- Q10: Selects locations that are 'Downtown' in their respective cities
SELECT Name, City, Neighborhood
FROM [Location]
WHERE Neighborhood = 'Downtown';

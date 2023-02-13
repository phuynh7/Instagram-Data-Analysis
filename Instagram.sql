-- Reformat Date and Time
Select CONVERT(nvarchar,time,1) 
from PortfolioProject.dbo.InstagramPostData

select * from PortfolioProject.dbo.InstagramPostData

Alter Table InstagramPostData
Add Dates varchar(255)

Update InstagramPostData
Set Dates = CONVERT(varchar,Date,1) 

Alter Table InstagramPostData
drop column Date

SELECT CONVERT(VARCHAR, Time , 8)
from PortfolioProject.dbo.InstagramPostData

Alter Table InstagramPostData
Add TimeFormat varchar(255)

Update InstagramPostData
set TimeFormat = CONVERT(VARCHAR, Time , 8)

Alter Table InstagramPostData
drop column Time



select * from PortfolioProject.dbo.InstagramPostData


--How does time affect accounts reached for reels


Create view time_for_accts_reached_reels as 
select Week, TimeFormat, Post_Type, round(avg(Accounts_Reached),0) as avg_accounts_reached_reels
from PortfolioProject.dbo.InstagramPostData
Where Post_type ='Reel'
Group by Post_Type, TimeFormat,week 


-- How does time affect plays

Create view timeplays as 
select distinct plays, TimeFormat, Post_Type
from PortfolioProject.dbo.InstagramPostData
Group by Post_Type, TimeFormat, plays



-- How does Time Affect Accounts Reached for all other post

Create view time_accts_for_all_posts as 
select Week, TimeFormat, Post_Type, round(avg(Accounts_Reached),0) as avg_accounts
from PortfolioProject.dbo.InstagramPostData
Where Post_type <> 'Reel'
Group by Post_Type, TimeFormat,week 


-- How does content type affect accounts reached for reels

Create view content_for_reels as
select Post_Type,Content_Type, round(avg(Accounts_Reached),0) as avg_accounts_reached_reels
from PortfolioProject.dbo.InstagramPostData
Where Post_type ='Reel'
Group by Post_Type, Content_Type


-- How does content type affect accounts engaged for reels

Create view content_for_engaged_reels as
select Post_Type,Content_Type, round(avg(Accounts_Engaged),0) as avg_accounts_engaged_reels
from PortfolioProject.dbo.InstagramPostData
Where Post_type ='Reel'
Group by Post_Type, Content_Type


--How does content type effect accounts engaged for all other posts

Create view content_for_engaged_post as
select Post_Type,Content_Type, round(avg(Accounts_Engaged),0) as avg_accounts_engaged_reels
from PortfolioProject.dbo.InstagramPostData
Where Post_type <> 'Reel'
Group by Post_Type, Content_Type

-- What content types have the most likes

create view content_likes as 
select distinct Content_Type, Post_type, Likes
from PortfolioProject.dbo.InstagramPostData
group by Likes, Content_Type,Post_type



select * from PortfolioProject.dbo.InstagramPostData





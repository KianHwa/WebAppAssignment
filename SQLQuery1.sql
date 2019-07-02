Select * from aspnet_Membership inner join aspnet_Users 
on aspnet_Membership.UserId = aspnet_Users.UserId
inner join Artwork on aspnet_Membership.UserId = Artwork.artistID 
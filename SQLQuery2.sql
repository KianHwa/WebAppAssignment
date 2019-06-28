select Artwork.artworkName from 
Member inner join Orders
on member.memberID = orders.memberID
inner join OrderDetails 
on Orders.orderID = OrderDetails.orderID
inner join Artwork 
on OrderDetails.artworkID = Artwork.artworkID
where Member.memberName = 'Ho'
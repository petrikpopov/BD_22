DECLARE @MAX_v INT = 1000000
declare @min int = 3
DECLARE @checK BIT;
 DECLARE @CONST INT = 2;
WHILE (@min <= @MAX_v)
BEGIN
    SET @check = 1;
   
    WHILE (2 <= SQRT(@min))
    BEGIN
        IF (@min % 2 = 0)
        BEGIN
            SET @check = 0;
            BREAK;
        END
		
        SET @CONST = @CONST + 1;
    END
    IF (@check = 1)
    BEGIN
        PRINT @min;
    END
    SET @min = @min + 1;
END

----------------------------------
use [My Game]
declare @a int = rand()*8
declare @b int = rand()*8
declare @c int = rand()*8
declare @stavca int = 50 -- пользователь всегда будет ставить 50
declare @result int 
select @result = Result from Game_Score
select @a as '1', @b as '2' ,@c as '3'
set @result -=10
update Game_Score set Result = @result
if(@a=5 and @b =5 and @c = 5)
Begin 
set @result +=100
end
else
begin
 set @result -=@stavca
end
if(@a=7 and @b =7 and @c = 7)
begin
print('You winner!!!')
set @result +=1500
end
else
begin
 set @result -=@stavca
end
if(@result<=0)
begin
print('You dont have maney')
end
update Game_Score set Result = @result
select @result as 'My balance'
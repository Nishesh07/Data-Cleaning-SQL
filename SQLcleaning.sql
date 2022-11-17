--changing SaleDate from Datetime to date date format
--Date wasn't updating using update method so decided to create a new column

ALTER TABLE dbo.NashvilleHousing
ADD SaleDate_converted Date
UPDATE  dbo.NashvilleHousing
SET SaleDate_converted = CAST(SaleDate AS date)
select*
from dbo.NashvilleHousing

--Deleting the old SaleDate column

ALTER TABLE dbo.NashvilleHousing
DROP COLUMN SaleDate
select*
from dbo.NashvilleHousing

--splitting property address to address and state

select
SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1),
SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1,LEN(PropertyAddress))
from dbo.NashvilleHousing
ALTER TABLE dbo.NashvilleHousing
ADD ADDRESS VARCHAR(50)
ALTER TABLE dbo.NashvilleHousing
ADD CITY VARCHAR(50)
UPDATE dbo.NashvilleHousing
SET ADDRESS = SUBSTRING(PropertyAddress,1,CHARINDEX(',',PropertyAddress)-1)
UPDATE dbo.NashvilleHousing 
SET CITY = SUBSTRING(PropertyAddress,CHARINDEX(',',PropertyAddress)+1,LEN(PropertyAddress)) 
select*
from dbo.NashvilleHousing

--Seperating OwnerAddress using other method

select PARSENAME(REPLACE(OwnerAddress,',','.'),3),
PARSENAME(REPLACE(OwnerAddress,',','.'),2),
PARSENAME(REPLACE(OwnerAddress,',','.'),1)
from dbo.NashvilleHousing
ALTER TABLE dbo.NashvilleHousing
ADD Owner_Address varchar(50)
ALTER TABLE dbo.NashvilleHousing
ADD Owner_city varchar(50)
ALTER TABLE dbo.NashvilleHousing
ADD Owner_State varchar(50)
UPDATE dbo.NashvilleHousing
SET Owner_Address = PARSENAME(REPLACE(OwnerAddress,',','.'),3)
UPDATE dbo.NashvilleHousing
SET Owner_city = PARSENAME(REPLACE(OwnerAddress,',','.'),2)
UPDATE dbo.NashvilleHousing
SET Owner_state = PARSENAME(REPLACE(OwnerAddress,',','.'),1)
select*
from dbo.NashvilleHousing
--changing SoldAsVacant to YES/NO format since there are soms Y's and N's
select SoldAsVacant, 
CASE WHEN SoldAsVacant = 'N' THEN 'No'
WHEN SoldAsVacant = 'Y' THEN 'YES'
ELSE SoldAsVacant
END
from dbo.NashvilleHousing
--Updating the SoldAsVacant column
UPDATE dbo.NashvilleHousing
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'N' THEN 'No'
WHEN SoldAsVacant = 'Y' THEN 'YES'
ELSE SoldAsVacant
END

select DISTINCT SoldAsVacant
from dbo.NashvilleHousing 









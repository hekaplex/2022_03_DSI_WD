--All Columns
SELECT [Id],[MSSubClass],[MSZoning],[LotFrontage],[LotArea],[Street],[Alley],[LotShape],[LandContour],[Utilities],[LotConfig],[LandSlope],[Neighborhood],[Condition1],[Condition2],[BldgType],[HouseStyle],[OverallQual],[OverallCond],[YearBuilt],[YearRemodAdd],[RoofStyle],[RoofMatl],[Exterior1st],[Exterior2nd],[MasVnrType],[MasVnrArea],[ExterQual],[ExterCond],[Foundation],[BsmtQual],[BsmtCond],[BsmtExposure],[BsmtFinType1],[BsmtFinSF1],[BsmtFinType2],[BsmtFinSF2],[BsmtUnfSF],[TotalBsmtSF],[Heating],[HeatingQC],[CentralAir],[Electrical],[_1stFlrSF],[_2ndFlrSF],[LowQualFinSF],[GrLivArea],[BsmtFullBath],[BsmtHalfBath],[FullBath],[HalfBath],[BedroomAbvGr],[KitchenAbvGr],[KitchenQual],[TotRmsAbvGrd],[Functional],[Fireplaces],[FireplaceQu],[GarageType],[GarageYrBlt],[GarageFinish],[GarageCars],[GarageArea],[GarageQual],[GarageCond],[PavedDrive],[WoodDeckSF],[OpenPorchSF],[EnclosedPorch],[_3SsnPorch],[ScreenPorch],[PoolArea],[PoolQC],[Fence],[MiscFeature],[MiscVal],[MoSold],[YrSold],[SaleType],[SaleCondition],[SalePrice]
FROM
Train
GO

SELECT [Id],[LotArea],[OverallQual],[OverallCond],[BedroomAbvGr],[TotRmsAbvGrd],[SalePrice]
FROM
Train
WHERE OverallQual = 10;
GO

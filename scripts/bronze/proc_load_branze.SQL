/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME ,@batch_start_time DATETIME, @batch_end_time DATETIME;
    BEGIN TRY 
        SET @batch_start_time = GETDATE();
        PRINT '======================================';
        PRINT 'Loading Bronze layer';
        PRINT '======================================';

        PRINT '--------------------------------------';
        PRINT 'Loading CRM Tables';
        PRINT '--------------------------------------';

        SET @start_time =  GETDATE();
        PRINT '>> Truncating Table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;
        
        PRINT '>> Inserting Data Into: bronze.crm_cust_info';
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\vansh\AppData\Local\Temp\85f7d469-e40e-4bd1-8a28-3954f595d192_sql-data-warehouse-project.zip.192\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH (
            FIRSTROW=2 ,--SKIP THE FIRST ROW(SINCE THAT IS THE COLUMN NAMES)
            FIELDTERMINATOR =',',
            ROWTERMINATOR = '0x0a', -- force LF only
            TABLOCK
        );
        SET @end_time =  GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
        PRINT '>>------------------<<';

        SET @start_time =  GETDATE();
        PRINT '>> Truncating Table: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;
        
        PRINT '>> Inserting Data Into: bronze.crm_prd_info';
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\vansh\AppData\Local\Temp\eec973a5-4383-4386-8f0d-319af8cc06f9_sql-data-warehouse-project.zip.6f9\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH (
            FIRSTROW=2 ,--SKIP THE FIRST ROW(SINCE THAT IS THE COLUMN NAMES)
            FIELDTERMINATOR =',',
            ROWTERMINATOR = '0x0a', -- force LF only
            TABLOCK
        );
        SET @end_time =  GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
        PRINT '>>------------------<<';

        SET @start_time =  GETDATE();
        PRINT '>> Truncating Table: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;
        
        PRINT '>> Inserting Data Into: bronze.crm_sales_details';
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\vansh\AppData\Local\Temp\b5d24ed2-bfd1-48ab-a8a3-d81de38adb5d_sql-data-warehouse-project.zip.b5d\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW=2 ,--SKIP THE FIRST ROW(SINCE THAT IS THE COLUMN NAMES)
            FIELDTERMINATOR =',',
            ROWTERMINATOR = '0x0a', -- force LF only
            TABLOCK
        );
        SET @end_time =  GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
        PRINT '>>------------------<<';

        PRINT '--------------------------------------';
        PRINT 'Loading ERP Tables';
        PRINT '--------------------------------------';

        SET @start_time =  GETDATE();
        PRINT '>> Truncating Table: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;
        
        PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\vansh\AppData\Local\Temp\dabe24aa-a0af-47e0-a905-b19db8a6b105_sql-data-warehouse-project.zip.105\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW=2 ,--SKIP THE FIRST ROW(SINCE THAT IS THE COLUMN NAMES)
            FIELDTERMINATOR =',',
            ROWTERMINATOR = '0x0a', -- force LF only
            TABLOCK
        );
        SET @end_time =  GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
        PRINT '>>------------------<<';

        SET @start_time =  GETDATE();
        PRINT '>> Truncating Table: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;
        
        PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\vansh\AppData\Local\Temp\afff3bd0-332b-4f9a-a384-0e779ccd7842_sql-data-warehouse-project.zip.842\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW=2 ,--SKIP THE FIRST ROW(SINCE THAT IS THE COLUMN NAMES)
            FIELDTERMINATOR =',',
            ROWTERMINATOR = '0x0a', -- force LF only
            TABLOCK
        );
        SET @end_time =  GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
        PRINT '>>------------------<<';

         SET @start_time =  GETDATE();
        PRINT '>> Truncating Table: bronze.erp_px_cat_giv2';
        TRUNCATE TABLE bronze.erp_px_cat_giv2;
        
        PRINT '>> Inserting Data Into: bronze.erp_px_cat_giv2';
        BULK INSERT bronze.erp_px_cat_giv2
        FROM 'C:\Users\vansh\AppData\Local\Temp\c404e29d-9236-4a31-b317-8d4e37a6b8ad_sql-data-warehouse-project.zip.8ad\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW=2 ,--SKIP THE FIRST ROW(SINCE THAT IS THE COLUMN NAMES)
            FIELDTERMINATOR =',',
            ROWTERMINATOR = '0x0a', -- force LF only
            TABLOCK
        );
        SET @end_time =  GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
        PRINT '>>------------------<<';

        SET @batch_end_time = GETDATE();
        PRINT '======================================';
        PRINT 'Loading Bronze layer is completed';
        PRINT '>> Total Load Duration: ' + CAST(DATEDIFF(second,@batch_start_time,@batch_end_time) AS NVARCHAR) + ' seconds';
        PRINT '======================================';

    END TRY
    BEGIN CATCH
        PRINT '==========================================================='
        PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
        PRINT 'Error Message' + ERROR_MESSAGE();
		    PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		    PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
        PRINT '==========================================================='
    END CATCH
END


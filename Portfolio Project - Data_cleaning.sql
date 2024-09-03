--  Data Cleaning

select * from layoffs;

-- 1. Remove duplicates
-- 2. Standarize the Data
-- 3. Null Values or blank values
-- 4. Remove any columns

create table layoffs_staging
like layoffs;

select * from layoffs_staging;

Insert into layoffs_staging
select * from layoffs;

-- removing dupliates

select *,
Row_number() Over (
partition by company,location,industry, total_laid_off,percentage_laid_off,`date`, stage, country , funds_raised_millions) as row_num
from layoffs_staging;

WITH duplicate_cte AS
(
select *,
Row_number() Over (
partition by company,location,industry, total_laid_off,percentage_laid_off,`date`, stage, country , funds_raised_millions) as row_num
from layoffs_staging
)
select * from duplicate_cte 
where row_num >1;

-- Create a new table with row_num as a column

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from layoffs_staging2;

-- Insert data from layoffs_staging with row_num as a column

insert into layoffs_staging2
select *,
Row_number() Over (
partition by company,location,industry, total_laid_off,percentage_laid_off,`date`, stage, country , funds_raised_millions) as row_num
from layoffs_staging;

select * from layoffs_staging2
where row_num>1;

Delete from layoffs_staging2
where row_num>1;

-- Standardizing data

select distinct company , TRIM(company) 
from layoffs_staging2;


update layoffs_staging2
set company = TRIM(company);

select distinct industry 
from layoffs_staging2
order by 1;

select distinct country
from layoffs_staging2 order by 1;

update layoffs_staging2
set country = 'United states'
where country like 'United states%' ;


select `date`,
str_to_date(`date`,'%m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date`,'%m/%d/%Y');

select `date` from layoffs_staging2;

-- change date column to Date Datatype

alter table layoffs_staging2
modify column `date` DATE;


-- 3. Null Values or blank values

select * 
from layoffs_staging2
where total_laid_off IS NULL
AND percentage_laid_off IS NULL;

select * from 
layoffs_staging2
where industry IS NULL
OR industry= '';

-- 4. Remove any columns

alter table  
layoffs_staging2
Drop column row_num;

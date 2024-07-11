-- Exploratory Data Analysis

-- Here we are jsut going to explore the data and find trends or patterns or anything interesting like outliers

-- normally when you start the EDA process you have some idea of what you're looking for

-- with this info we are just going to look around and see what we find!

select * from
world_layoffs.layoffs_staging2;

-- Looking at Percentage to see how big these layoffs were

select MAX(total_laid_off), MAX(percentage_laid_off)
from
world_layoffs.layoffs_staging2;

-- check the total_laid_off company wise

select company, SUM(total_laid_off) AS total_laid_off
from world_layoffs.layoffs_staging2
group by company order by 2 desc;

-- check the total_laid_off industry wise

select industry,SUM(total_laid_off) AS total_laid_off
from world_layoffs.layoffs_staging2
group by industry order by 2 desc;

-- check the total_laid_off date wise

select YEAR(`date`),SUM(total_laid_off) AS total_laid_off
from world_layoffs.layoffs_staging2
group by YEAR(`date`) order by 1 desc;

-- check the total_laid_off stage wise

select stage,SUM(total_laid_off) AS total_laid_off
from world_layoffs.layoffs_staging2
group by stage order by 1 desc;

-- Rolling Total of Layoffs Per Month

WITH Rolling_total AS
(
select substring(`date`,1,7) AS `MONTH`, SUM(total_laid_off) AS total_laid_off
from world_layoffs.layoffs_staging2
where substring(`date`,1,7) IS not null
group by MONTH order by MONTH
)
select `MONTH`, SUM(total_laid_off) Over(order by `MONTH`) as rolling_total
from Rolling_total
 ;




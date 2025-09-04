-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging2;

SELECT MAX(total_laid_off) , MAX(percentage_laid_off)
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC ;


SELECT company , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;


SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;


SELECT industry , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT YEAR(`date`) , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`) 
ORDER BY 1 DESC;



SELECT stage , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage 
ORDER BY 2 DESC;


SELECT *
FROM layoffs_staging2;

SELECT company , AVG(percentage_laid_off)
FROM layoffs_staging2
GROUP BY company 
ORDER BY 2 DESC;

WITH Rolling_layoffs AS(
SELECT SUBSTRING(`date`,1,7) AS `MONTH`,  SUM(total_laid_off) AS Rolling_total_layoffs
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 )

SELECT `MONTH`, Rolling_total_layoffs, SUM(Rolling_total_layoffs) OVER(ORDER BY `MONTH`) AS Rolling_Total
FROM Rolling_layoffs ;




SELECT company , YEAR(`Date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`Date`) 
ORDER BY 3 DESC ;



WITH Company_year (Company, Years, Total_laid_off) AS 
(
SELECT company , YEAR(`Date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`Date`) 
), Company_year_rank AS
(
SELECT *, DENSE_RANK() OVER(PARTITION BY Years ORDER BY Total_laid_off DESC) AS ranks
FROM Company_year
WHERE Years IS NOT NULL
)
SELECT *
FROM Company_year_rank 
WHERE ranks <=5;

-- DONE--

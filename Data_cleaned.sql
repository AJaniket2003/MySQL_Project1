-- Data Cleaning Project


SELECT *
FROM layoffs;


-- 1. Remove Duplicates
-- 2. Standardize the Data 
-- 3. Null Values or Blank Values
-- 4. Remove Any Columns



CREATE TABLE layoffs_Staging
LIKE layoffs;


SELECT *
FROM layoffs_Staging;


INSERT layoffs_Staging
SELECT *
FROM layoffs;


SELECT *
FROM layoffs_Staging;


-- 1. Remove Duplicates

SELECT *, ROW_NUMBER() OVER( PARTITION BY company , location ,industry ,total_laid_off, 'date', stage, country, funds_raised_millions) as row_num
FROM layoffs_Staging;


WITH duplicate_cte AS (
SELECT *, ROW_NUMBER() OVER( PARTITION BY company, location, industry, total_laid_off, 
percentage_laid_off, date, stage, country, funds_raised_millions) as row_num
FROM layoffs_Staging)
SELECT * 
FROM duplicate_cte
WHERE row_num > 1;



SELECT *
FROM layoffs_Staging
WHERE company = 'Wildlife Studios';


CREATE TABLE layoffs_Staging2
WITH duplicate_cte AS (
SELECT *, ROW_NUMBER() OVER( PARTITION BY company, location, industry, total_laid_off, 
percentage_laid_off, date, stage, country, funds_raised_millions) as row_num
FROM layoffs_Staging)
SELECT * 
FROM duplicate_cte;



DELETE
FROM layoffs_Staging2
WHERE row_num > 1;


SELECT *
FROM layoffs_Staging2
WHERE row_num > 1;



SELECT *
FROM layoffs_Staging;


SELECT *
FROM layoffs_Staging2;



-- 2. Standardization

SELECT company, TRIM(company)
FROM layoffs_staging2;


UPDATE layoffs_staging2
SET company = TRIM(company);


SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY industry;

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry like 'Crypto%';

SELECT *
FROM layoffs_Staging2
WHERE industry like 'Crypto%';




SELECT DISTINCT country
FROM layoffs_Staging2
ORDER BY country;

UPDATE layoffs_Staging2
SET country = TRIM(TRAILING '.' FROM country);


SELECT `date`
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date` , '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;


SELECT *
FROM layoffs_staging2;

-- 3. Null Values or Blank Values

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;


SELECT DISTINCT industry 
FROM layoffs_staging2;



SELECT *
FROM layoffs_staging2
WHERE industry IS NULL 
OR industry = '';


UPDATE layoffs_staging2
SET industry = NULL 
WHERE industry = ''; 


SELECT *
FROM layoffs_staging2
WHERE company = 'Airbnb';



SELECT *
FROM layoffs_staging2 AS LS1
JOIN layoffs_staging2 AS LS2
	ON LS1.company = LS2.company
    AND LS1.location = LS2.location
WHERE LS1.industry IS NULL 
AND LS2.industry IS NOT NULL ;



UPDATE layoffs_staging2 AS LS1
JOIN layoffs_staging2 AS LS2
	ON LS1.company = LS2.company
SET LS1.industry = LS2.industry
WHERE LS1.industry IS NULL 
AND LS2.industry IS NOT NULL;



SELECT *
FROM layoffs_staging2
WHERE company LIKE "Bally's%";

SELECT *
FROM layoffs_staging2;

-- 4. Remove Any Columns

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;


DELETE 
FROM layoffs_staging2
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2;
 
 
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;


-- DONE

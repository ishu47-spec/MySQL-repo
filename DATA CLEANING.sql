-- DATA CLEANING 

SELECT *
FROM layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the data
-- 3. Null Values or blank data
-- 4. Remove any columns

CREATE TABLE layoffs_staging
LIKE layoffs;

INSERT INTO layoffs_staging
SELECT*
FROM layoffs;

SELECT *
FROM layoffs_staging;

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions ) AS row_num
FROM layoffs_staging;

TRUNCATE TABLE layoffs_staging;            # used to empty the rows and colmns of table when needed

# Now lets find out the duplicated colmns

WITH duplicate_cte AS 
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions ) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte 
WHERE row_num > 1;

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

SELECT *
FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions ) AS row_num
FROM layoffs_staging ;

SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

DELETE
FROM layoffs_staging2
WHERE row_num > 1;

SELECT *
FROM layoffs_staging2;

-- Standardizing data

SELECT company, TRIM(company)        # As you noticed there are unnecessary spaces, so we trim them
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoffs_staging2               # we have columns for crypto and crypto currency but both are same and shall be named same
ORDER BY 1;

SELECT *
FROM layoffs_staging2           
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%'
;

SELECT DISTINCT country     # we found United States and United States. are same but different
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET country = 'United States'
WHERE country LIKE 'United States%';

-- Convert text date to proper date format
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

-- Change column type
ALTER TABLE layoffs_staging2
MODIFY column `date` DATE;

-- REMOVING Null Values

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT * 
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

SELECT *
FROM layoffs_staging2
WHERE company = 'Airbnb';         # now we fill the null by of Airbnb 1st by travel (of Airbnb 2nd)

SELECT *
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company             # First check if it's possible to fill
    AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
AND (t2.industry IS NOT NULL AND t2.industry != '');

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company             # First check if it's possible to fill
    AND t1.location = t2.location
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL OR t1.industry = '')
AND (t2.industry IS NOT NULL AND t2.industry != '');

DELETE                      # deleting rows with null total_laid_off and percentage_laid_off
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;



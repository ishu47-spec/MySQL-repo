-- Exploratory data analysis

SELECT *
FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1                        # companies that laid off entire team and were closed probably
ORDER BY funds_raised_millions DESC;                   # large companies ordered by the funds raised

SELECT company, SUM(total_laid_off), industry        
FROM layoffs_staging2
GROUP BY company, industry                        # companies with largest no. of layoffs
ORDER BY 2 DESC;

SELECT industry, SUM(total_laid_off)           
FROM layoffs_staging2
GROUP BY industry                       # industries with largest no. of layoffs
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off)           
FROM layoffs_staging2
GROUP BY country                     # countries with largest no. of layoffs
ORDER BY 2 DESC;

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;            # initiation and ending date of the data collected

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2             # no. of layoffs in a given year
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

SELECT stage, SUM(total_laid_off)           
FROM layoffs_staging2
GROUP BY stage 
ORDER BY 2 DESC ;                 # stages with largest no. of layoffs

SELECT SUBSTRING(`date`, 1, 7) AS year_and_month, SUM(total_laid_off)
FROM layoffs_staging2
WHERE `date` IS NOT NULL           # shows no. of layoffs in a respective month in asc order 
GROUP BY year_and_month
ORDER BY year_and_month;

WITH Rolling_tot AS
(
SELECT SUBSTRING(`date`, 1, 7) AS year_and_month, SUM(total_laid_off) AS laid
FROM layoffs_staging2
WHERE `date` IS NOT NULL           # shows no. of layoffs in a respective month in asc order 
GROUP BY year_and_month
ORDER BY year_and_month
)
SELECT year_and_month, laid, SUM(LAID) OVER(ORDER BY year_and_month) AS rolling_total
FROM Rolling_tot;








          
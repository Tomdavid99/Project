select *
From CovidDeaths
order by 3,4
;

Select Location, date,total_cases,new_cases,total_deaths,population
From Project..CovidDeaths
Where continent is not null
order by 1,2


Select Location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From Project..CovidDeaths
where location like '%states%'
and continent is not null
order by 1,2

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From Project..CovidDeaths
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc

Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
From Project..CovidDeaths
--Where location like '%states%'
Where continent is not null 
Group by Location
order by TotalDeathCount desc

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From Project..CovidDeaths
--Where location like '%states%'
Where continent is not null 
Group by continent
order by TotalDeathCount desc

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From Project..CovidDeaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2

--select *
--From CovidVAcc
--order by 3,4;


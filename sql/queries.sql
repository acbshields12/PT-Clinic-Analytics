create database physical_therapy;

use physical_therapy;

CREATE TABLE therapy_visits (
    Visit_ID VARCHAR(20) PRIMARY KEY,
    Patient_ID VARCHAR(20),
    Patient_Age INT,
    Gender VARCHAR(10),
    Diagnosis VARCHAR(50),
    Treatment_Type VARCHAR(50),
    Therapist_ID VARCHAR(20),
    Therapist_Name VARCHAR(100),
    Visit_Date DATE,
    Session_Duration_Min INT,
    Visits_Completed INT,
    Pain_Score_Before INT,
    Pain_Score_After INT,
    Improvement_Percentage DECIMAL(5,2),
    Insurance_Provider VARCHAR(50),
    Insurance_Coverage_Percent DECIMAL(5,2),
    Treatment_Cost DECIMAL(10,2),
    Insurance_Payment DECIMAL(10,2),
    Patient_Payment DECIMAL(10,2),
    Clinic_Location VARCHAR(50),
    Revenue DECIMAL(10,2),
    Satisfaction_Score DECIMAL(3,2)
);

-- Total Revenue
select sum(revenue) as total_revenue
from therapy_visits;

-- Revenue by Clinic
select Clinic_Location,
sum(Revenue) as revenue
from therapy_visits
group by Clinic_Location
order by revenue desc;

-- Revenue by Treatment
select Treatment_Type, sum(revenue) as revenue
from therapy_visits
group by Treatment_Type
order by revenue desc;

-- Most Common DIagnosis
select diagnosis, count(*) as total_visits
from therapy_visits
group by diagnosis
order by total_visits desc;

-- Therapist Productivity
select Therapist_Name, count(*) as visits, sum(revenue) as revenue
from therapy_visits
group by Therapist_Name
order by revenue desc;

-- Treatment Effectiveness
select Treatment_Type, avg(Improvement_Percentage) as avg_improv
from therapy_visits
group by Treatment_Type
order by avg_improv desc;

-- Insurance Contribution
select Insurance_Provider,sum(Insurance_Payment) as insurance_revenue
from therapy_visits
group by Insurance_Provider
order by insurance_revenue desc;

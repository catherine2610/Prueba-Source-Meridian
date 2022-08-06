SELECT concept_Id, concept_name
FROM `bigquery-public-data.cms_synthetic_patient_data_omop.concept` 
WHERE (concept_name like '%diabetes%' OR concept_name like '%mellitus')
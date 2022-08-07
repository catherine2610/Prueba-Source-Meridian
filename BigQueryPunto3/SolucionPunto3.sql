SELECT concept.concept_name, 
domain_id,
SUM(A.deceased_person) cant_deceased
FROM
(SELECT person.person_id,
CASE WHEN death.person_id IS NULL THEN 0
ELSE 1
END deceased_person
FROM `bigquery-public-data.cms_synthetic_patient_data_omop.person` person
LEFT JOIN `bigquery-public-data.cms_synthetic_patient_data_omop.death` death
ON (person.person_id = death.person_id)) A

INNER JOIN `bigquery-public-data.cms_synthetic_patient_data_omop.procedure_occurrence` proc 
ON (proc.person_id=A.person_id)

INNER JOIN `bigquery-public-data.cms_synthetic_patient_data_omop.concept` concept
ON (proc.procedure_concept_id= concept.concept_id)

WHERE (concept_name like '%mellitus%' or concept_name like '%diabetes%')
GROUP BY concept_name, domain_id

UNION DISTINCT

SELECT concept.concept_name, 
domain_id,
sum(A.deceased_person) cant_deceased

FROM
(SELECT person.person_id,
CASE WHEN death.person_id IS NULL THEN 0
ELSE 1
END deceased_person
FROM `bigquery-public-data.cms_synthetic_patient_data_omop.person` person
LEFT JOIN `bigquery-public-data.cms_synthetic_patient_data_omop.death` death
ON (person.person_id = death.person_id)) A

INNER JOIN `bigquery-public-data.cms_synthetic_patient_data_omop.condition_era` condition 
ON (condition.person_id=A.person_id)

INNER JOIN `bigquery-public-data.cms_synthetic_patient_data_omop.concept` concept
ON (condition.condition_concept_id= concept.concept_id)

WHERE (concept_name like '%mellitus%' or concept_name like '%diabetes%')
GROUP BY concept_name, domain_id

UNION DISTINCT

SELECT concept.concept_name, 
domain_id,
sum(A.deceased_person) cant_deceased

FROM
(SELECT person.person_id,
CASE WHEN death.person_id IS NULL THEN 0
ELSE 1
END deceased_person
FROM `bigquery-public-data.cms_synthetic_patient_data_omop.person` person
LEFT JOIN `bigquery-public-data.cms_synthetic_patient_data_omop.death` death
ON (person.person_id = death.person_id)) A

INNER JOIN `bigquery-public-data.cms_synthetic_patient_data_omop.drug_era` drug
ON (drug.person_id=A.person_id)

INNER JOIN `bigquery-public-data.cms_synthetic_patient_data_omop.concept` concept
ON (drug.drug_concept_id= concept.concept_id)

WHERE (concept_name like '%mellitus%' or concept_name like '%diabetes%')
GROUP BY concept_name, domain_id
ORDER BY domain_id DESC
;


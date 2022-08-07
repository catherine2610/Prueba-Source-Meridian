SELECT person.person_id,
death.person_id deceased_person_id,
CASE WHEN death.person_id IS NULL THEN 0
ELSE 1
END deceased_person
FROM `bigquery-public-data.cms_synthetic_patient_data_omop.person`  person
LEFT JOIN `bigquery-public-data.cms_synthetic_patient_data_omop.death` death
ON (person.person_id = death.person_id);

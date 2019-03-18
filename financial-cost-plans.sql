SELECT DISTINCT p.id                                                 AS id, 
                p.object_id                                          AS object_id, 
                p.code                                               AS code, 
                p.name                                               AS name, 
                p.description                                        AS description, 
                p.revision                                           AS revision, 
                p.is_plan_of_record                                  AS is_plan_of_record, 
                p.plan_type_code                                     AS plan_type_code, 
                p.period_type_code                                   AS period_type_code, 
                p.start_period_id                                    AS start_period_id, 
                p.end_period_id                                      AS end_period_id, 
                p.benefit_plan_id                                    AS benefit_plan_id, 
                p.status_code                                        AS status_code, 
                p.total_cost                                         AS total_cost, 
                p.total_units                                        AS total_units, 
                p.total_revenue                                      AS total_revenue, 
                p.budget_submit_option                               AS budget_submit_option, 
                p.created_by                                         AS created_by, 
                GREATEST(p.created_date, pp.created_date)            AS created_date, 
                p.last_updated_by                                    AS ppm_last_updated_by, 
                GREATEST(
                  p.last_updated_date, 
                  pp.last_updated_date, 
                  COALESCE(pd.last_updated_date, p.last_updated_date)
                ) 								                                   AS last_updated_date 
FROM   fin_plans p 
       INNER JOIN odf_ca_costplan pp 
               ON p.id = pp.id 
       LEFT OUTER JOIN fin_cost_plan_details pd 
               ON p.id = pd.plan_id 

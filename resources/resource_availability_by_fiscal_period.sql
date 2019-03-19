SELECT 
  r.id || p.id        AS id,
  r.id                AS resource_id,
  p.id                AS period_id,
  p.period_type       AS period_type,
  sum(s.slice)        AS hours,
  max(s.created_date) AS created_date
FROM    
  srm_resources r    
  INNER JOIN prj_blb_slices s 
    ON r.id = s.prj_object_id
  INNER JOIN biz_com_periods p 
    ON  s.SLICE_DATE >= p.start_date 
        AND s.SLICE_DATE < p.end_date
WHERE 
  1 = 1
  AND slice_request_id = 1
GROUP BY
  r.id, 
  p.id, 
  p.period_type

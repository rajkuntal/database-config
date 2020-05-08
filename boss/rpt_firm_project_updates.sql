DELIMITER //
CREATE DEFINER=`dibsdbuser`@`%` PROCEDURE `rpt_firm_project_updates`(
	IN v_date TIMESTAMP
)
BEGIN

select
	df.id 'Firm ID',
	df.name 'Firm Name',
	dp.id 'Project ID',
	dp.name 'Project Name'
from trade.design_firm df
	join trade.design_project dp on dp.design_firm_id=df.id
		and dp.status=1 

where 1
	and df.status=1	
	and dp.last_user_updated >= v_date
group by df.id, dp.id
;

END//
DELIMITER ;

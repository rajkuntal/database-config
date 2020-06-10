DELIMITER ;;
CREATE PROCEDURE `reporting`.`rpt_GROWTH_5520_dynamic_buyPage`()
BEGIN

select r.id 'root_id',
    	t.page_name,
    	if(max(if(p.name='dynamicPage', p.value, null)) = 'true', true, false) 'dynamicPage',
    	max(if(p.name='title', p.value, null)) 'title',
       	max(if(p.name='primary_url', p.value, null)) 'primaryUrl',
    	max(if(p.name='secondary_url', p.value, null)) 'secondaryUrl',
    	max(if(p.name='searchCount', p.value, null)) 'searchCount',
    	max(if(p.name='itemResultsCount', p.value, null)) 'itemResultsCount', 
    	max(if(p.name='duplicate_type', p.value, null)) 'duplicatePage', 
    	max(if(p.name='similar_page', p.value, null)) 'similarPage'
from JSONPage.page_type t 
join JSONPage.page_root r on r.page_type_id=t.id 
join JSONPage.page_element pe on r.id=pe.root_id
join JSONPage.page_element_property p on pe.id=p.page_element_id
where 1
    and t.page_name like 'buy:%'
    and r.status='scheduled'
group by t.page_name
order by r.created_date		
;
END;;
DELIMITER ;

INSERT INTO `dibsreporting_config` (`name`, `display_name`, `description`, `stored_proc`, `permission_id`)
VALUES
	('allScheduledIncludingDynamicBuyPages', 'All Scheduled Including Dynamic Buy Pages', NULL, 'reporting.`rpt_GROWTH_5520_dynamic_buyPage`', 1404);
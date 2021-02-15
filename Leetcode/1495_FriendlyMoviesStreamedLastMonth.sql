select distinct title
from(  select content_id    from TVProgram
       where program_date between '2020-06-01' and '2020-06-30') a
left join content on a.content_id = content.content_id
where Kids_content='Y' and content_type = 'Movies'

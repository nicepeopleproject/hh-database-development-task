select area_id, AVG(compensation_from) as avg_comensation_from, AVG(compensation_to) as avg_compensation_to
from vacancies
group by area_id;
require 'json'
require 'api_for_asana'
module HomesHelper
  include ApiForAsana

  def task_list(id)
    tasks = get_tasks(id)
    JSON.parse(tasks.body)
  end
end

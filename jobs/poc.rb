# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '15s', :first_in => 0 do |job|
  send_event('response_time_KFM', { value: (rand*400).to_i})
  send_event('response_time_SKV', { value: (rand*400).to_i})
 end
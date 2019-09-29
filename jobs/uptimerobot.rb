require 'uptimerobot'

SCHEDULER.every '5m', :first_in => 0 do |job|
client = UptimeRobot::Client.new(api_key: 'u743480-c049cda2e6030391da878eb3')

raw_monitors = client.getMonitors['monitors']

monitors = raw_monitors.map { |monitor|
{
friendlyname: monitor['friendly_name'],
status: 'S' << monitor['status'].to_s
}
}

send_event('uptimerobot', { monitors: monitors } )
end
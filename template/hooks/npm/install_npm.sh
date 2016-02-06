function install_npm()
{
	local method
	local notifier
	local notification_message="You should run NPM!"
	if get_hook_config npm onChange method required
	then
		case $method in
			just_warn)
				if get_hook_config notification notifier notifier required
				then
					case $notifier in
						echo|notify-send|testNotifier)
							$notifier "$notification_message"
							;;
						*)
							echo "notification.notifier should be one of echo or notify-send"
							;;
					esac
				fi
				;;
			run)
				npm install
				;;
			*)
				echo "npm.onChange value should be just_warn or run" >&2
				;;
		esac
	fi
}

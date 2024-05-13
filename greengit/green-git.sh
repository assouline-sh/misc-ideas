#!/bin/bash

# To use: place in home directory and add `bash green-git.sh` to .zshrc

# Get number of Github contributions for today
get_contrib_count() {
	query='query {
	  user(login: \"assouline-sh\") {
	    contributionsCollection {
	      contributionCalendar {
	        totalContributions
	        weeks {
	          contributionDays {
	            contributionCount
	            date
	          }
	        }
	      }
	    }
	  }
	}
	'
	query="$(echo $query)"
	
	# Add personal access token after 'Bearer'
	response=$(curl -s -H "Authorization: Bearer " \
		-H 'Content-Type: application/json' \
		-X POST -d "{ \"query\": \"$query\"}" https://api.github.com/graphql)
	contribution_count=$(echo "$response" | jq -r '.data.user.contributionsCollection.contributionCalendar.weeks[] | .contributionDays[] | select(.date | startswith("'"$(date +%Y-%m-%d)"'")) | .contributionCount')

	echo $contribution_count
}

# Add row of emojis at top of terminal
modify_term() {
	contrib_count=$(get_contrib_count)
	term_width=$(tput cols)

	if [ "$contrib_count" -eq 0 ]; then
		for ((i=0; i<term_width/2; i++)); do
            echo -n "🌱"
        done
		echo ""
	fi
}

modify_term

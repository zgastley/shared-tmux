#!/bin/sh
CONTEXT=$(kubectl config current-context)

if echo "$CONTEXT" | grep -q "dev"; then
	COLORS=$(tmux show-option -gqv @nova-segment-dev-colors)
	echo "#[fg=${COLORS%% *},bg=${COLORS##* }]app-dev"

elif echo "$CONTEXT" | grep -q "tst"; then
	COLORS=$(tmux show-option -gqv @nova-segment-tst-colors)
	echo "#[fg=${COLORS%% *},bg=${COLORS##* }]app-tst"

elif echo "$CONTEXT" | grep -q "stg"; then
	COLORS=$(tmux show-option -gqv @nova-segment-stg-colors)
	echo "#[fg=${COLORS%% *},bg=${COLORS##* }]app-stg"

elif echo "$CONTEXT" | grep -q "app-prd"; then
	COLORS=$(tmux show-option -gqv @nova-segment-prd-colors)
	echo "#[fg=${COLORS%% *},bg=${COLORS##* }]app-prd"

elif echo "$CONTEXT" | grep -q "infra-prd"; then
	COLORS=$(tmux show-option -gqv @nova-segment-infra-prd-colors)
	echo "#[fg=${COLORS%% *},bg=${COLORS##* }]infra-prd"

else
	COLORS=$(tmux show-option -gqv @nova-segment-default-colors)
	echo "#[fg=${COLORS%% *},bg=${COLORS##* }]$CONTEXT"
fi

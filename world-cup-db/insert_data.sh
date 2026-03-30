#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

INSERT_VALUE() {
  if [[ -n "$1" ]]
  then
    # Escape single quotes
    local TEAM_NAME=$(echo "$1" | sed "s/'/''/g")
    $PSQL "INSERT INTO teams(name) VALUES('$TEAM_NAME') ON CONFLICT (name) DO NOTHING;" > /dev/null
    # Return team_id
    $PSQL "SELECT team_id FROM teams WHERE name = '$TEAM_NAME'"
  fi
}
while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  [[ $YEAR == "year" ]] && continue
  
  WINNER_ID=$(INSERT_VALUE "$WINNER")
  OPPONENT_ID=$(INSERT_VALUE "$OPPONENT")

  [[ -z $WINNER_ID || -z $OPPONENT_ID ]] && continue

  $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) \
  VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);"
done < games.csv
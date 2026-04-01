#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon -A -q --tuples-only -c"

echo -e "\n~~~~~ Dino-Spa ~~~~~\n\n"

echo -e "Welcome! Looking for a T-Rex-tra special treatment?"

SERVICES=$($PSQL "SELECT service_id, name FROM services")

SERVICE_MENU() {
  if [[ -n $1 ]]
  then
    echo -e "\n\n$1"
  fi
  echo -e "\nOur Services:"
  echo "$SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME; do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    SERVICE_MENU "Please enter the displayed service number."
  else
    HANDLE_SERVICE_NAME
  fi
}

HANDLE_SERVICE_NAME() {
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  if [[ -z $SERVICE_NAME ]]
  then
    SERVICE_MENU "Please enter the displayed service number."
  else
    HANDLE_CUSTOMER_PHONE
  fi
}

HANDLE_CUSTOMER_PHONE() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  if [[ -z $CUSTOMER_PHONE ]]
  then
    HANDLE_CUSTOMER_PHONE
  else
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    HANDLE_CUSTOMER_OR_APPOINTMENT
  fi
}

HANDLE_CUSTOMER_OR_APPOINTMENT() {
    if [[ -z $CUSTOMER_ID ]]
    then
      INSERT_CUSTOMER_DATA
    else
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      HANDLE_APPOINTMENT_TIME
    fi
}

INSERT_CUSTOMER_DATA() {
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  if [[ -z $CUSTOMER_NAME ]]
  then
    INSERT_CUSTOMER_DATA
  else
    CUSTOMER_ID=$($PSQL "INSERT INTO customers(name, phone) \
    VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE') RETURNING customer_id")
    HANDLE_APPOINTMENT_TIME
  fi
}

HANDLE_APPOINTMENT_TIME() {
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  if [[ -z $SERVICE_TIME ]]
  then
    HANDLE_APPOINTMENT_TIME
  else
    INSERT_APPOINTMENT
  fi
}

INSERT_APPOINTMENT() {
  $PSQL "INSERT INTO appointments(customer_id, service_id, time) \
  VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');"
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME. It's going to be **roarsome**!"
}

SERVICE_MENU
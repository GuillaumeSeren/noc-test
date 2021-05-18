#!/usr/bin/env bash

# error table:
# 1 value lower than minumum
# 2 value higher than maximum
# 3 duplicate has been found

# output should contain only number between 1-10
echo "Check if any of the value is outside desired range 1-10"
output=( $(bash ./script.sh) )
# test error
# output+=(99)

iErrorFlag=0

for value in "${output[@]}";
do
  if [[ $value -lt 1 ]]; then
    echo "Error: Value ($value) is outside range"
    ((iErrorFlag++))
    exit 1
  elif [[ $value -gt 10 ]]; then
    echo "Error: Value ($value) is outside range"
    exit 2
    ((iErrorFlag++))
  fi
done

if [ "$iErrorFlag" -eq 0 ]; then
  echo "No error"
fi

# output should not contain duplicated Number
echo "Check if there is any duplicate in the output"
output=( $(bash ./script.sh) )
# test error
# output+=(5)

iErrorFlag=0

for value in "${output[@]}";
do
  iDupeElement=0
  for dupe in "${output[@]}";
  do
    # Check element
    if [[ "$value" == "$dupe" ]]; then
      (( iDupeElement++))
    fi
  done

  if [[ $iDupeElement -gt 1 ]]; then
    echo "Error: There is a duplicate value ($value)"
    ((iErrorFlag++))
    exit 3
  fi
done

if [ "$iErrorFlag" -eq 0 ]; then
  echo "No error"
fi

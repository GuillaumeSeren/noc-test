#!/usr/bin/env bash

# Write the number 1-10 in random order
# each number should appear only once

## 1 generate the inital input array
declare -a aSeqDecimal
for i in {1..10}
do
  aSeqDecimal+=("$i")
done

# Loop the initial data
declare -a aRandDecimal
for i in "${aSeqDecimal[@]}"
do
  # get a random element
  element=${aSeqDecimal[$RANDOM % ${#aSeqDecimal[*]}]}

  # add the element to the output array
  aRandDecimal+=("$element")

  # Cleaning the original input array
  declare -a aCleanedArray=()
  for j in "${aSeqDecimal[@]}"
  do
    if [ "$j" != "$element" ]; then
      aCleanedArray+=( "$j" )
    fi
  done

  # Override the original input array with the cleaned
  aSeqDecimal=( "${aCleanedArray[@]}" )
done

# Show the output
echo "${aRandDecimal[@]}"

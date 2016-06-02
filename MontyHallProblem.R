# An R implementation of the Monty Hall Problem
# https://en.wikipedia.org/wiki/Monty_Hall_problem

rm(list = ls())

n_tries <- 100000 # how many times do we repeat the experiment
n_doors <- 3

successes_keeping <- 0
successes_switching <- 0
for (i in 1:n_tries) {

  doors <- rep(0,n_doors) # all doors, without prizes
  doors[sample(1:n_doors,1)] <- 1 # put prize behind a random door

  picked_door <- doors[sample(1:n_doors,1)] # participant picks a door randomly

  # the host now opens every unpicked door but one
  # the prize is still behind one of the two closed doors
  remaining_door <- if (picked_door == 1) 0 else 1

  # the participant can choose to keep his door,
  # or change for the remaining one

  # if participant keeps his door, is it the prize?
  if (picked_door == 1) {
    successes_keeping <- successes_keeping + 1
  }

  # if participant takes the remaning door, is it the price?
  if (remaining_door == 1) {
    successes_switching <- successes_switching + 1
  }

}

cat(
  "Success rate keeping the same door ",
  round(successes_keeping / n_tries, digits = 2),
  "\r\n"
)
cat(
  "Success rate switching to the remaining door ",
  round(successes_switching / n_tries, digits = 2),
  "\r\n"
)

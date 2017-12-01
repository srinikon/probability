n <- 10^5
child1 <- sample(2,n,replace=TRUE)
child2 <- sample(2,n,replace=TRUE)
# Here child1 is a vector of length n, where each element is a 1 or a 2. Letting 1 stand
# for “girl” and 2 stand for “boy”, this vector represents the gender of the elder child
# in each of the n families. Similarly, child2 represents the gender of the younger
# child in each family.
# Alternatively, we could have used
sample(c("girl","boy"),n,replace=TRUE)

n.b <- sum(child1==1) #child 1 is a girl
n.ab <- sum(child1==1 & child2==1) # both children are girls
n.ab/n.b # prob P(GG|child1=G)

n.b <- sum(child1==1 | child2==1)
n.ab <- sum(child1==1 & child2==1)
n.ab/n.b

# Monty Hall simulation
n <- 10^5
cardoor <- sample(3,n,replace=TRUE)

monty <- function() {
  doors <- 1:3
  # randomly pick where the car is
  cardoor <- sample(doors,1)
  # prompt player
  print("Monty Hall says ‘Pick a door, any door!’")
  # receive the player’s choice of door (should be 1,2, or 3)
  chosen <- scan(what = integer(), nlines = 1, quiet = TRUE)
  # pick Monty’s door (can’t be the player’s door or the car door)
  if (chosen != cardoor) montydoor <- doors[-c(chosen, cardoor)]
  else montydoor <- sample(doors[-chosen],1)
  # find out whether the player wants to switch doors
  print(paste("Monty opens door ", montydoor, "!", sep=""))
  print("Would you like to switch (y/n)?")
  reply <- scan(what = character(), nlines = 1, quiet = TRUE)
  # interpret what player wrote as "yes" if it starts with "y"
  if (substr(reply,1,1) == "y") chosen <- doors[-c(chosen,montydoor)]
  # announce the result of the game!
  if (chosen == cardoor) print("You won!")
  else print("You lost!")
}

monty()

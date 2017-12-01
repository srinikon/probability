# Chapter 1

# vectors
v <- c(3,1,4,1,5,9)
sum(v)
v[2]
v[c(1,3,5)]
v[-(2:4)]

1/(1:100)^2

n <- 10; k <- 5
sample(n,k)
sample(4, 10000, replace=TRUE, prob=c(0.1,0.2,0.3,0.4))

# combinations
choose(n,k)
# permutations
choose(n,k) * factorial(k)

#log(n!)
lfactorial(k)
lchoose(n,k)

# Let’s show by simulation that the probability of a matching card is approximately 1 − 1/e when the deck is sufficiently large.
n <- 100
r <- replicate(10^4,sum(sample(n)==(1:n)))
sum(r>=1)/10^4

1 - 1/exp(1)

# Birthday problem
k <- 23
1-prod((365-k+1):365)/365^k
pbirthday(23) # returns the probability of at least one match if the room has k people
qbirthday(0.5) # returns the number of people needed in order to have probability p of at least one match
pbirthday(23)
qbirthday(0.5)

pbirthday(23,coincident=3)
qbirthday(0.5,coincident=3)

b <- sample(1:365,23,replace=TRUE)
tabulate(b)

r <- replicate(10^4, max(tabulate(sample(1:365,23,replace=TRUE))))
sum(r>=2)/10^4


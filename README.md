# PhoneDropping

Solver for the item dropping class of problems, here adapted to phones as a solution to Reddit Programmer Challenge #395: https://www.reddit.com/r/dailyprogrammer/comments/o9k0p0/20210628_challenge_395_intermediate_phone_drop/.

The program solves the problem using binomial coefficients and binary search. It implements two methods:

- drops_worst_case allows to find the smallest number of drops in the worst case that will be necessary to determine starting from which floor a phone will break, given the number of phones and floors.
- phones_optimal allows to find the optimal number of phones that will be necessary to achieve the *minimum* smallest number of drops in the worst case, given only the number of floors. This method will use the previous one.

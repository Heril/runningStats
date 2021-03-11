# runningStats
Calculate running statistics (mean, standard deviation and median) of inputs from stdin, printing to stdout for each


To execute for inputing via stdin, on a system with R installed, run the command:

`Rscript runningStats.R`.

Expected behavior:
- When a valid number is entered it will be added into the running summary statistics.
- If a non-empty, non-numeric entry is entered, it will be ignored.
- If an empty entry is entered, the program will exit.

For the sake of simplifying the code execution, the new numbers added are added to the `sumval` and `sumsq`, which are the sum of all entries and sum of squared entries respectively. Thus, by keeping track of the count of entries, `nval`, the mean can be calculated simply by dividing the sum by the count, and the standard deviation can be calculated using the form:

$Var[X] = E[X^2] - E[X]^2$

The median is calculated using the base median function in R.
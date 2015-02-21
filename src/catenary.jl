#=
Catenary Problem

The problem is to find the shape of a hanging chain. It can be defined as the configuration that minimizes the potential energy.

Objective: linear
Constraints: convex quadratic
Feasible set: convex

This model finds the shape of a hanging chain
The solution is known to be y = cosh(a*x) + b
for appropriate a and b.

This problem is a port to Julia/JuMP of a model by Professor Robert Vanderbei
at Prineceton University, originally written in AMPL.
Source: http://orfe.princeton.edu/~rvdb/ampl/nlmodels/
=#

using JuMP
using Ipopt         # Nonlinear solver
using Gadfly, Cairo # Graphing support

N = 100   # number of chainlinks
L = 1     # difference in x-coords of endlinks
h = 2*L/N # length of each link

m = Model(solver=IpoptSolver())

@defVar(m, x[1:N]) # Julia is 1-indexed
@defVar(m, y[1:N])

# Minimize potential energy from center of mass for link
@setObjective(m, Min, sum{(y[j-1] + y[j])/2, j=2:N})

# Anchor ends
@addConstraint(m, x[1] == 0)
@addConstraint(m, y[1] == 0)
@addConstraint(m, x[N] == L)
@addConstraint(m, y[N] == 0)

# Set starting values
for j in 1:N
    setValue(x[j], 0)
    setValue(y[j], 0)
end


# Link together pieces
for j in 2:N # Remember 1-index
    @addNLConstraint(m,
        (x[j] - x[j-1])^2 + (y[j] - y[j-1])^2 <= h^2
    )
end

solve(m)

# Graph the data

x_clean = Float64[]
y_clean = Float64[]
for j in 1:N
    push!(x_clean, getValue(x)[j])
    push!(y_clean, getValue(y)[j])
end

catenary = plot(x=x_clean, y=y_clean, Coord.Cartesian(xmin=0, xmax=1,))
draw(PNG("catenary.png", 6inch, 6inch), catenary)

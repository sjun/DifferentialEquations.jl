#######
##FEM Heat Animation Test
#######

#Generates an animation for a solution of the heat equation
#Uses Plots.jl, requires matplotlib >=1.5
using DifferentialEquations, Plots, ImageMagick
T = 2
Δx = 1//2^(3)
Δt = 1//2^(9)
fem_mesh = parabolic_squaremesh([0 1 0 1],Δx,Δt,T,:dirichlet)
prob = heatProblemExample_moving()

sim = solve(fem_mesh::FEMmesh,prob::HeatProblem,alg=:Euler,save_timeseries=true)

println("Generating Animation")
TEST_PLOT && animate(sim::FEMSolution;zlims=(0,.1),cbar=false)

## Should have moved off the frame.
maximum(sim.u) .< 1e-6

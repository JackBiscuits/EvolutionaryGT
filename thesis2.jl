using Agents, AgentsPlots

mutable struct Provideragent <: AbstractAgent
    id::Int # The identifier number of the agent
    wealth::Vector{Float64}
    profit::Vector{Float64}
    T::Bool
    PT::Bool
end

mutable struct Consumeragent <: AbstractAgent
    id::Int # The identifier number of the agent
    wealth::Vector{Float64}
    profit::Vector{Float64}
    T::Bool
    PT::Bool
end

function Tmodel(; numagents = 100, initwealth = 10)
    model = ABM(Xagent, scheduler = random_activation)
    for i in 1:numagents
        add_agent!(model,[initwealth],[initwealth],rand(Bool),rand(Bool))
    end
    return model
end

model = Tmodel()

function mimic(;)
    if nagent.wealth >agent.wealth & nagent.T =/= agent.T
        if agent.PT = nagent.T
            agent.T = nagent.T
        else
            if max{0,ragent.wealth[end]}/(maximum(abs,(agent.wealth-ragent.wealth))) > rand()
                agent.T = nagent.T
            end
        end
    end
    return agent.T
end

function agent_step!(agent, model, Tuble)

    ragent = random_agent(model) #find random consumerJa
#    nagent = neighborthingy(model) #find neighbor agent

    #choosing strategy according to neighbor agent and previous experince
    #execute
    if agent.T == ragent.T == TRUE
        push!(agent.wealth, R)
        push!(ragent.wealth, R)
        agent.PT = TRUE
    elseif agent.T == ragent.T == FALSE
        push!(agent.wealth, (1-p)*X)
        push!(ragent.wealth, (d_u-1)*X)
        agent.PT = FALSE
    elseif agent.T== TRUE & ragent.T == FALSE
        push!(agent.wealth, -S)
        push!(ragent.wealth, Temp)
        agent.PT=FALSE
    elseif agent.T==FALSE & ragent.T == TRUE
        push!(agent.wealth, 2*(1-p)*X)
        push!(ragent.wealth, (d_t -1)*X)
        agent.PT=TRUE
    end


end
N = 500 #number of iterations
M = 2000 #number of agents
#payoff parameter:
Tuble= (R= 10,p=0.5,d_u =0.5, d_t=0.5, Temp=15,X=7)

adata = [:wealth,:Trustlink]
model = Tmodel(numagents = M)
data, _ = run!(model, agent_step!, N; adata = adata)
data[(end - 200):end, :]


#count the total strats, update each iteration.

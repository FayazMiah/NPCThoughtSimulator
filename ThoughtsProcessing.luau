local module = {}

local PlayerSessionThoughts = {}
module.PlayerSessionThoughts = PlayerSessionThoughts
local players = game:GetService("Players")

local complexitybias = {
	["Simple"] = 1,
	["Moderate"] = 5,
	["Complex"] = 20,
	["HighlyComplex"] = 40,
	
}

local NPCScaling = {
	["Noob"] = 1,
	["Bacon"] = 50,
	["GamerGirl"] = 250
}

function module.AddThought(thought, playerName)
	for _, playersThought in pairs(PlayerSessionThoughts) do
		if playersThought["Owner"] == playerName then
			table.insert(playersThought["Thoughts"], thought)
			print("added")
		end
	end 
end

function module.GetThoughts(playerName)
	local thoughts = {}	
	for _, playersThought in pairs(PlayerSessionThoughts) do
		if playersThought["Owner"] == playerName then
			for _, thought in pairs(playersThought["Thoughts"]) do
				table.insert(thoughts, thought)
			end
		end
	end 
	return thoughts
end




function module.RemoveThought(playerName, index)
	for _, playersThought in pairs(PlayerSessionThoughts) do
		if playersThought["Owner"] == playerName then
			table.remove(playersThought["Thoughts"], index)
			break -- Exit after removing, no need to continue looping
		end
	end 
end

function module.DetermineThoughtDensity(thought)
	local sentence = thought[1]
	local complexity = thought[2]
	local NPCType = thought[3]

	local characters = #sentence
	local words = string.split(sentence)
	local numWords = #words

	local characterWordRatio = (characters / numWords) * 0.05
	local density = complexitybias[complexity] * math.log10(1 + characters) * NPCScaling[NPCType] * characterWordRatio

	return density
end

function module.GetThoughtsValue(playerName)
	local thoughts = module.GetThoughts(playerName)
	local summedDensity = 0

	for i = #thoughts, 1, -1 do
		local thoughtDensity = module.DetermineThoughtDensity(thoughts[i])
		summedDensity += thoughtDensity
	end
	local MoneyEarned = math.round(summedDensity * 100)
	return MoneyEarned
end

function module.SellThoughts(playerName)
	local thoughts = module.GetThoughts(playerName)
	local netThought = players[playerName].leaderstats["Largest Thought Collection"]
	local netValue = netThought.Value
	local summedDensity = 0

	for i = #thoughts, 1, -1 do
		local thoughtDensity = module.DetermineThoughtDensity(thoughts[i])
		summedDensity += thoughtDensity
		module.RemoveThought(playerName, i)
	end
	--print(module.GetThoughts(playerName))

	local MoneyEarned = math.round(summedDensity * 100)
	local moneyStat = game.Players[playerName].leaderstats.Money
	moneyStat.Value = moneyStat.Value + MoneyEarned

	if MoneyEarned > netValue then
		netThought.Value = MoneyEarned
	end
end


return module




local players = game:GetService("Players")
local event = game.ServerStorage.NewThoughtEvent
local ThoughtsProcessing = require(game.ServerStorage.ThoughtsProcessing)


players.PlayerAdded:Connect(function(player)
	local playerThoughts = {
		["Owner"] = player.Name,
		["Thoughts"] = {}
	}
	table.insert(ThoughtsProcessing.PlayerSessionThoughts, playerThoughts)
end)

players.PlayerRemoving:Connect(function(player)	
	for i, playersThought in pairs(ThoughtsProcessing.PlayerSessionThoughts) do
		if playersThought.Owner == player.Name then
			
			-- CREATE SAVE DATA HERE
			
			table.remove(ThoughtsProcessing.PlayerSessionThoughts, i)
			break
		end
	end
end)

local RS = game:GetService("ReplicatedStorage")

players.PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message)
		require(game.ServerStorage.ThoughtsProcessing).GetThoughtsValue("DianiteShadow")
	end)
end)

RS.SelectThought.OnServerEvent:Connect(function(player, sentence, board)
	player:FindFirstChild("SelectedThought").Value = sentence
	board.SurfaceGui.CurrentThought.Text = sentence
end)


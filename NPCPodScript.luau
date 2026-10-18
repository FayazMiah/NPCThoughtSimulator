
local CS = game:GetService("CollectionService")
local pods = CS:GetTagged("NPCPod")
local NPCPodClass = require(game.ServerStorage.NPCPodClass)
local InteractionModule = require(game.ServerStorage.InteractionPointModule)

local RS = game:GetService("ReplicatedStorage")

function moneyVal(n)
	local suffixes = {"", "K", "M", "B", "T", "Q"}
	local magnitude = 1

	while math.abs(n) >= 1000 and magnitude < #suffixes do
		n = n / 1000
		magnitude = magnitude + 1
	end

	-- Format to 2 decimal places if needed
	local formatted
	if n % 1 == 0 then
		formatted = string.format("%d", n)
	else
		formatted = string.format("%.2f", n):gsub("0+$", ""):gsub("%.$", "")
	end

	return formatted .. suffixes[magnitude]
end

RS.PodPurchaseEvent.OnServerEvent:Connect(function(player, pod)
	
	if pod:GetAttribute("PurchaseOwner") ~= player.Name then return end
	
	local status = pod.Status
	local currentStage = status:GetAttribute("CompletionStage")
	local price = pod.Prices:GetAttribute(currentStage)
	if (not price) then return end
	
	if player.leaderstats.Money.Value < price then return end
	player.leaderstats.Money.Value = player.leaderstats.Money.Value - price
	
	local NPCType = status:GetAttribute("NPCType")
	
	if currentStage == 0 and status:GetAttribute("Extracting") == false then
		NPCPodClass.BuildPod(pod, "Simple")
		NPCPodClass.IntialisePod(pod, NPCType)
	else
		if currentStage <= status:GetAttribute("MaxCompletion") then
			NPCPodClass.BuildPod(pod, "Moderate")
			local currentNPC = pod:FindFirstChild("NPC")
			local nextNPC = NPCType .. tostring(currentNPC:GetAttribute("Stage") + 1)
			NPCPodClass.ChangeNPCInPod(pod, nextNPC)
			if currentStage + 1 == 2 then
				status:SetAttribute("Complexity", "Moderate")
			elseif currentStage + 1 == 3 then
				status:SetAttribute("Complexity", "Complex")
			elseif currentStage + 1 == 4 then
				status:SetAttribute("Complexity", "HighlyComplex")
			end
		end
	end
	
	status:SetAttribute("CompletionStage", currentStage + 1)
	local nextstage = status:GetAttribute("CompletionStage")
	local textlabel = pod.InteractionPoint.interactionPoint.BillboardGui.Frame.TextLabel
	local price = pod.Prices:GetAttribute(nextstage)
	
	if currentStage < status:GetAttribute("MaxCompletion") then
		textlabel.Text = "UPGRADE POD" .. " [$" .. moneyVal(price) .. "]"
		InteractionModule.moveNext(pod.InteractionPoint)
	else
		InteractionModule.DisablePoint(pod.InteractionPoint, true)
	end
	
	
end)
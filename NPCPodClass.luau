local module = {}

local NPCs = game.ServerStorage.NPCs
local players = game:GetService("Players")
local ChatService = game:GetService("Chat")
local rs = game:GetService("ReplicatedStorage")
local LanguageProcessor = require(game.ServerStorage.LanguageProcessing)
local ThoughtsProcessor = require(game.ServerStorage.ThoughtsProcessing)
local pods = game.ServerStorage.Pods



local function StartThoughtExtraction(pod)
	local status = pod:FindFirstChild("Status")
	local player = pod:GetAttribute("PurchaseOwner")
	local NPCType = pod:FindFirstChild("NPC"):GetAttribute("NPCType")
	while status:GetAttribute("Extracting") do
		local stage = status:GetAttribute("CompletionStage")
		local period = pod:FindFirstChild("ThinkingRates"):GetAttribute(stage)
		rs.PodAnimation:FireAllClients(pod.PodStructure.CompletionStatus, period)
		wait(period)
		local complexity = status:GetAttribute("Complexity")
		local sentence = LanguageProcessor.StructureSentence(complexity)
		--ChatService:Chat(pod.Output.OutputPart, sentence)
		spawn(function()
			local text = pod.Output.OutputPart.SurfaceGui.Frame.templateText:Clone()
			text.Visible = true
			text.Name = "OutputText"
			text.Text = '"' .. sentence .. '"'
			text.Parent = pod.Output.OutputPart.SurfaceGui.Frame
		
		--	thoughtStoreEvent:Fire({sentence, complexity}, player)
			ThoughtsProcessor.AddThought({sentence, complexity, NPCType}, player)
			wait(period * 8)
			text:Destroy()
		end)
	end
end

function module.ChangeNPCInPod(pod, NPCname)
	local newNPC = NPCs[NPCname]:Clone()
	if pod:FindFirstChild("NPC") then
		pod.NPC:Destroy()
	end
	newNPC.Parent = pod
	newNPC:PivotTo((pod.PodStructure:FindFirstChild("PodPart").CFrame) * (CFrame.Angles(0, 0, -math.pi/2)) )
	pod.PodStructure:FindFirstChild("NamePart").SurfaceGui.NPCName.Text = newNPC:GetAttribute("Name")
	rs.NPCAnimation:FireAllClients(newNPC)
	newNPC.Name = "NPC"
end

function module.BuildPod(pod, podType)
	if pod:FindFirstChild("PodStructure") then 
		pod:FindFirstChild("PodStructure"):Destroy()
	end
	local relativeCFrame = pod.LoadPosition.CFrame
	local podStructure = pods[podType]:Clone()
	podStructure.Parent = pod
	podStructure:PivotTo(relativeCFrame * CFrame.Angles(0, math.pi/2, 0))
	podStructure.Name = "PodStructure"
	
end

function module.IntialisePod(pod, npcnametype)
	spawn(function()
		
		local status = pod:FindFirstChild("Status")
		if status:GetAttribute("Extracting") then
			return
		end
		
		module.ChangeNPCInPod(pod, (npcnametype .. "1"))
		status:SetAttribute("Extracting", true)
		status:SetAttribute("Complexity", "Simple")
		status:SetAttribute("CompletionStage", 1)
		StartThoughtExtraction(pod)
		
	end)
end

return module

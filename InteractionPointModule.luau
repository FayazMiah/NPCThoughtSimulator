local module = {}

--DEPENDANCY: acts as linked list
-- no value represents no pointer (null)
-- otherwise points to next interaction point
-- independance given by attribute
-- max required denotes a maxmimum upgrade is needed for progression

function module.moveNext(InteractionPoint)
	local dependancy = InteractionPoint.Parent.Dependancy
	
	local nextV = dependancy.Value
	if nextV then -- (not tail pointer)
		local nextInteractionPoint = nextV.InteractionPoint
		if nextInteractionPoint then
			module.ActivatePoint(nextInteractionPoint)
		end
	end
end

function module.DisablePoint(InteractionPoint, isMax)
	local dependancy = InteractionPoint.Parent.Dependancy
	if isMax then
		InteractionPoint.interactionPoint.BillboardGui.Frame.TextLabel.Text = "MAXIMUM REACHED"
		module.moveNext(dependancy)
	end
	
	for _, v in pairs(InteractionPoint:GetDescendants()) do
		if v:IsA("Decal")  then
			v.Transparency = 1
		end
		if v:IsA("TextLabel") then 
			v.Visible = false
		end
	end
	InteractionPoint:SetAttribute("Usable", false)
end


function module.ActivatePoint(InteractionPoint)
	
	if InteractionPoint.interactionPoint.BillboardGui.Frame.TextLabel.Text == "MAXIMUM REACHED" then return end
	if InteractionPoint:GetAttribute("Usable") then return end
	
	for _, v in pairs(InteractionPoint:GetDescendants()) do
		if v:IsA("Decal")  then
			v.Transparency = 0
		end
		if v:IsA("TextLabel") then 
			v.Visible = true
		end
	end
	InteractionPoint:SetAttribute("Usable", true)
end



return module

local module = {}

local tokens = require(script.Parent.LanguageTokens)

local SyntacticPatterns = {
	Simple = {
		{"SUBJECT", "VERB"},
		{"SUBJECT", "VERB", "ADVERB"},
		{"SUBJECT", "VERB", "ADJECTIVE"},
		{"SUBJECT", "VERB", "DETERMINER", "NOUN"}
	},
	Moderate = {
		{"SUBJECT", "VERB", "ADJECTIVE", "NOUN"},
		{"SUBJECT", "MOOD_MODIFIER", "VERB", "ADVERB"},
		{"INTERJECTION", "SUBJECT", "VERB"},
		{"SUBJECT", "VERB", "CONNECTOR", "SUBJECT", "VERB"},
		{"SUBJECT", "MOOD_MODIFIER", "VERB", "ADVERB", "CONTEXT_TAG"}
	},
	Complex = {
		{"SUBJECT", "VERB", "DETERMINER", "ADJECTIVE", "NOUN", "CONNECTOR", "SUBJECT", "MOOD_MODIFIER", "VERB", "ADVERB"},
		{"INTERJECTION", "SUBJECT", "MOOD_MODIFIER", "VERB", "ADVERB", "CONTEXT_TAG"},
		{"SUBJECT", "VERB", "ADJECTIVE", "NOUN", "CONNECTOR", "SUBJECT", "MOOD_MODIFIER", "VERB", "ADVERB"},
		{"SUBJECT", "MOOD_MODIFIER", "VERB", "ADVERB", "CONNECTOR", "SUBJECT", "VERB", "DETERMINER", "ADJECTIVE", "NOUN"},
		{"INTERJECTION", "SUBJECT", "VERB", "CONNECTOR", "INTERJECTION", "SUBJECT", "VERB", "CONTEXT_TAG"}
	},
	HighlyComplex = {
		{"INTERJECTION", "SUBJECT", "MOOD_MODIFIER", "VERB", "ADVERB", "CONTEXT_TAG", "CONNECTOR", "SUBJECT", "VERB", "DETERMINER", "NOUN"},
		{"SUBJECT", "MOOD_MODIFIER", "VERB", "ADVERB", "CONTEXT_TAG", "CONNECTOR", "SUBJECT", "MOOD_MODIFIER", "VERB", "ADJECTIVE", "NOUN"},
		{"INTERJECTION", "SUBJECT", "VERB", "ADJECTIVE", "NOUN", "CONNECTOR", "SUBJECT", "MOOD_MODIFIER", "VERB", "ADVERB", "CONTEXT_TAG"},
		{"SUBJECT", "MOOD_MODIFIER", "VERB", "ADVERB", "EMOTICON", "CONNECTOR", "SUBJECT", "VERB", "ADJECTIVE", "NOUN"},
		{"INTERJECTION", "SUBJECT", "MOOD_MODIFIER", "VERB", "ADVERB", "CONTEXT_TAG", "EMOTICON"}
	}
}

function module.StructureSentence(complexity)
	local pattern = SyntacticPatterns[complexity][math.random(1, #SyntacticPatterns[complexity])]
	local tokenstring = ""
	for _, tokenType in pairs(pattern) do
		local availableWords = tokens[tokenType]
		local chosenToken = availableWords[math.random(1, #availableWords)]
		
		if tokenType == "ADVERB" then
			chosenToken = chosenToken .. ","
		elseif tokenType == "INTERJECTION" then
			chosenToken = chosenToken .. "!"
		end
		
		tokenstring = tokenstring .. chosenToken .. " "
	end

	tokenstring = tokenstring:match("^%s*(.-)%s*$")
	tokenstring = tokenstring:gsub("[,%s]+$", "")
	tokenstring = tokenstring .. "."

	return tokenstring
end

return module
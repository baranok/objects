function math.randomReal(min, max)
	return min+math.random()*(max-min)
end

function math.round(val)
	return math.floor(val+0.5)
end

function math.dice(dice,side)
    local x = 0

    for i=1,dice do
		x = x + math.random(1,side)
	end

	return x
end

--if 'probabilityPower' is above 1, lower values will be more common than higher values 
--if it's between 0 to 1, higher values will be more common than lower values.
--If it's 1, the results will be in a general randomness.
--Probability distribution function
function math.randomP(min, max, probabilityPower)
	return math.floor(min + (max + 1 - min) * (math.pow(math.random(), probabilityPower)))
end

function math.chance(chance)
	local x = math.random()
	if x <= chance then
		return true
	else
		return false
	end
end

function math.clamp(val, lower, upper)
    --assert(val and lower and upper, "not very useful error message here")
    if lower > upper then lower, upper = upper, lower end -- swap if boundaries supplied the wrong way
    return math.max(lower, math.min(upper, val))
end

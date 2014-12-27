local prototypes = require 'prototypes'
local clamp = math.clamp

return object(function(current, range)
	local timer = prototypes.timer()

	self.current = current or 0
	self.minValue = (type(range)=='table' and range[1]) or 0
	self.maxValue = (type(range)=='table' and range[2]) or 1

	self.dt = 0

	local valueFns = utils.bag()

	self.minFn = false
	self.maxFn = false
	self.enabled = true

	local function setValue(v)
		local finalize = false
		if self.enabled then
			if v < self.minValue and type(self.minFn)=='function' then
				self.current, finalize = self.minFn(v)
				if finalize then
					self.enabled = false
				end
			elseif v > self.maxValue and type(self.maxFn)=='function' then
				self.current,finalize = self.maxFn(v)
				if finalize then
					self.enabled = false
				end
			else
				self.current = clamp(v, self.minValue, self.maxValue)
			end
		end
	end

	local function addValue(v)
		setValue(self.current + v)
	end

	self.step = function()
		local timeDiff = timer.step()
		local time = timer.time

		for i, valueFn in valueFns.iter() do
			if not valueFn(time, timeDiff) then
				valueFns.remove(i)
			end
		end
		valueFns.process()
	end

	-- built-in diff function
	valueFns.insert(function(time, timeDiff)
		if self.dt ~= 0 then
			addValue(self.dt*timeDiff)
		end
		return true
	end)

	self.add = addValue

	self.mod = function(amount, totalTime, timeOffset)
		timeOffset = timeOffset or 0

	    if type(amount)=='function' then
    		valueFns.insert((function()
    			local startTime = timer.time + timeOffset
    			local endTime = startTime + totalTime

    			return function(time, timeDiff)
    				if (time >= startTime) then
	    				local diff = amount(endTime - time, self.current)
    					if type(diff)=='number' then
	    	                addValue(diff)
	        	            return true
						else
							return false
						end
					else
						return true
                	end
    	    	end
    		end)())
	    elseif type(amount)=='number' then
    		valueFns.insert((function()
    			local startTime = timer.time + timeOffset
    			local endTime = startTime + totalTime

    			local totalAmount = amount
    			local dt = amount/totalTime
    			local currentAmount = 0

    			return function(time, timeDiff)
    				local diff = dt*timeDiff
    				if (time >= startTime) then
	    				currentAmount = currentAmount + diff
	
	    				-- don't overshoot total amount
        				if amount>0 then
        					if currentAmount > totalAmount then
        						diff = (currentAmount-totalAmount)
        					end
        				else
        					if currentAmount < totalAmount then
        						diff = (currentAmount-totalAmount)
        					end
        				end
                        
                        addValue(diff)

        				if amount>0 then
        					return (time < endTime) and (currentAmount < totalAmount)
        	        	else
        					return (time < endTime) and (currentAmount > totalAmount)
        	        	end
        	    	else
        	    		return true
        	    	end
    	    	end
    		end)())
		end
	end
end)

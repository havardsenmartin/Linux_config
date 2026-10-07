#!/bin/bash

local NORMAL_IN = 6
local MIDDLE_OUT = 40
local HIGH_OUT = 125

local function cycle_gaps()
    local current = hl.get_config("general.gaps_out")

    if current.top == 0 then
        -- No gaps -> Middle
        hl.config({
            ["general.gaps_out"] = MIDDLE_OUT,
            ["general.gaps_in"] = NORMAL_IN,
        })

    elseif current.top < HIGH_OUT then
        -- Middle -> High
        hl.config({
            ["general.gaps_out"] = HIGH_OUT,
            ["general.gaps_in"] = NORMAL_IN,
        })

    else
        -- High -> No gaps
        hl.config({
            ["general.gaps_out"] = 0,
            ["general.gaps_in"] = 0,
        })
    end
end

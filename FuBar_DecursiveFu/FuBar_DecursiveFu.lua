-- FuBar_DecursiveFu: Simple FuBar plugin for Decursive.
-- Copyright (C):
--   * Zilver - 2008
--   * Qxcl - 2020
-- 
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

local _G = getfenv(0);

local tablet = AceLibrary("Tablet-2.0")
local dewdrop = AceLibrary("Dewdrop-2.0")
local L = AceLibrary("AceLocale-2.2"):new("FuBar_DecursiveFu")

DecursiveFu = AceLibrary("AceAddon-2.0"):new("FuBarPlugin-2.0", "AceDB-2.0")

DecursiveFu:RegisterDB("DecursiveFuDB");

local hint_text = "\n|cffeda55fClick|r toggle Priority List.".."\n|cffeda55fCtrl Click|r toggle Skip List.".."\n|cffeda55fShift Click|r toggle Live List.".."\n|cffeda55fAlt Click|r Decursive Options."


--Fubar plugin settings
DecursiveFu.hasIcon = true
DecursiveFu.canHideText = true
DecursiveFu.hasNoColor = true
DecursiveFu.clickableTooltip = false
DecursiveFu.cannotDetachTooltip = true
DecursiveFu.hideWithoutStandby = true
DecursiveFu.profileCode = true

DecursiveFu.defaultPosition = "LEFT";
DecursiveFu.defaultMinimapPosition = 317;


DecursiveFu.OnMenuRequest = {
	type = 'group',
	args = {},
}

function DecursiveFu:OnClick(self, button)
	if ( IsShiftKeyDown() ) then
		_G.Dcr_Hide()
	elseif ( IsAltKeyDown() ) then
		_G.Dcr_ShowHideOptionsUI()
	elseif ( IsControlKeyDown() ) then
		_G.Dcr_ShowHideSkipListUI()
	else
		_G.Dcr_ShowHidePriorityListUI()
   end
end

function DecursiveFu:OnEnable()
end

function DecursiveFu:OnTextUpdate()
	self:SetText("Decursive")
end

function DecursiveFu:OnTooltipUpdate()
	local cat = tablet:AddCategory('columns', 1)

	tablet:SetTitle("DecursiveFu")

	tablet:SetHint(hint_text)
end
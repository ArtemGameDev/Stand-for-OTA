include("shared.lua")
AddCSLuaFile("cl_init.lua")

function ENT:Initialize()
    self:SetModel("models/props_combine/combine_mine01.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_NONE)
    self:SetSolid(SOLID_VPHYSICS)
    self.cd = 0
end

function ENT:Think()
    if self.cd <= CurTime() then
        for k,v in pairs(ents.FindInSphere(self:GetPos(),500)) do
            if v:IsPlayer() then
                v:SetArmor(v:Armor() + 15)
            end
        end
        self.cd = CurTime() + 5
    end
end
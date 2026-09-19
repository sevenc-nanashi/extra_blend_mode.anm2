--information:extra_blend_mode.anm2 / https://github.com/sevenc-nanashi/extra_blend_mode.anm2
--label:色調整
---!param

---!shaders
---!shader_list

local target = obj.getoption("drawtarget")
local background = "cache:extra_blend_mode.background"
obj.effect()
obj.copybuffer(background, target)
obj.clearbuffer(target)
obj.draw()
obj.pixelshader(shaders[mode], target, { target, background }, {}, "copy")

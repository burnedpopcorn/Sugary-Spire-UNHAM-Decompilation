targetRoom = molasses_1
targetDoor = "A"
level = "molasses"
titlecard_sprite = spr_molassestitlecard
titlecard_index = 0
title_sprite = spr_molassestitle
title_index = 0
title_music = mu_crunchytitle
sprite_index = spr_molasses_gate
//parallax_array = [spr_molasses_gate_bg1.spr_molasses_gate_bg1.add_gate_parallax(0.15, self), spr_molasses_gate_bg2.spr_molasses_gate_bg2.add_gate_parallax(0.3, self), spr_molasses_gate_bg3.spr_molasses_gate_bg3.add_gate_parallax(0.45, self)]

parallax_array = [add_gate_parallax(spr_molasses_gate_bg1, 0.15), add_gate_parallax(spr_molasses_gate_bg2, 0.3), add_gate_parallax(spr_molasses_gate_bg3, 0.45)];
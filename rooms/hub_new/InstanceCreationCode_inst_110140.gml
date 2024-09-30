targetRoom = entryway_1
targetDoor = "A"
level = "entryway"
titlecard_sprite = spr_crunchytitlecard
titlecard_index = 0
title_sprite = spr_crunchytitle
title_index = 0
title_music = mu_crunchytitleloud
sprite_index = spr_entryway_gate
//parallax_array = [spr_entryway_gate_bg1.spr_entryway_gate_bg1.add_gate_parallax(0.15, self), spr_entryway_gate_bg2.spr_entryway_gate_bg2.add_gate_parallax(0.3, self), spr_entryway_gate_bg3.spr_entryway_gate_bg3.add_gate_parallax(0.45, self)]

parallax_array = [add_gate_parallax(spr_entryway_gate_bg1, 0.15), add_gate_parallax(spr_entryway_gate_bg2, 0.3), add_gate_parallax(spr_entryway_gate_bg3, 0.45)];

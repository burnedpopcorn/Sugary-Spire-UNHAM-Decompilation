targetRoom = steamy_1
targetDoor = "A"
level = "steamy"
titlecard_sprite = spr_cottontitlecard
titlecard_index = 0
title_sprite = spr_cottontowntitle
title_index = 0
title_music = mu_cottontitleloud
sprite_index = spr_steamy_gate
//parallax_array = [spr_steamy_gate_bg1.spr_steamy_gate_bg1.add_gate_parallax(0.15, self), spr_steamy_gate_bg2.spr_steamy_gate_bg2.add_gate_parallax(0.3, self), spr_steamy_gate_bg3.spr_steamy_gate_bg3.add_gate_parallax(0.45, self)]

parallax_array = [add_gate_parallax(spr_steamy_gate_bg1, 0.15), add_gate_parallax(spr_steamy_gate_bg2, 0.3), add_gate_parallax(spr_steamy_gate_bg3, 0.45)];

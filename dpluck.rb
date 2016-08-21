
live_loop :f do
  with_synth :pluck do
    with_fx :distortion do |r|
      print r
      s = play_chord chord(:C5, :m7),
        release: (ring 0.3, 0.12, 0.5).tick, amp: 1, reps:2 , attack: [2,0.5,1].choose
      sleep 0.25
      control s, mix: 0.93, reps: [33, 0 ,10, 44].choose, amp: 4, cutoff: (ring 0.3, 0.12, 0.5).tick
      sleep 0.15
    end
  end
end




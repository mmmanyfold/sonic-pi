live_loop :f do
  
  in_thread do
    with_synth :pluck do
      with_fx :distortion do |r|
        s = play_chord chord(:C5, :m7),
          release: 5
        sleep 5
      end
    end
  end
  
  ##| comment do
  in_thread do
    with_synth :pluck do
      with_fx :distortion do |r|
        ss = play_chord chord(:C5, :m7),
          release: (ring 0.3, 0.12, 0.5).tick, amp: 1, reps:1 , attack: [0.7,0.5,1].choose, release: [2, 0, 1].choose
        sleep 0.5
        control ss, mix: 0.93, reps: [33, 66 ,11, 44].choose, amp: 10, cutoff: (ring 0.3, 0.12, 0.5).tick
      end
    end
  end
  ##| end
  
  sleep 1
end








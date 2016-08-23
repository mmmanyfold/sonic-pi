live_loop :f do
  
  in_thread do
    with_synth  :pluck do
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
          release: (ring 0.3, 0.12, 0.5, 12).tick,
          divisor: rrand(50, 100),
          cutoff: (ring 0.1, 50).tick,
          amp: [5, 2, 1, 3, 0, 7, 4, 8].choose,
          attack: [0.7,0.5,1].choose
        
        sleep 0.25
        
        control ss,
          mix: 0.33,
          reps: [33, 6 ,11, 44].choose,
          amp: [5, 2, 1, 3, 0].choose,
          cutoff: (ring 3, 50, 100).tick
        
        sleep 0.115
        
        control ss,
          mix: 0.99,
          reps: 20,
          amp: [2, 0, 1].choose,
          cutoff: 0.5
        
      end
    end
  end
  ##| end
  sleep 1
end










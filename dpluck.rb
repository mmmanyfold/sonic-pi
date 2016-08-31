
releases = (ring 0.3, 0.12, 0.5, 12)
cutoffs  = (ring 0.0)
times = (ring 1, 0.75, 5, 0.25, 0.125, 5)

live_loop :f do
  
  use_bpm 124
  
  in_thread do
    with_synth  :pluck do
      with_fx :distortion do |r|
        s = play_chord chord(:C5, :m7),
          release: 5
        
        sleep 5
        
        sample :loop_tabla,
          start: 0.6,
          finish: [0.7, 1, 0.66, 0.7, 1, 0.66].choose,
          rate: 25
        
      end
    end
  end
  
  in_thread do
    
    with_synth :pluck do
      with_fx :distortion do |r|
        
        ss = play_chord chord(:C5, :m7),
          release: releases.tick,
          cutoff: cutoffs.tick,
          amp: [5, 2, 1, 3, 0, 5, 4, 2].choose,
          attack: [0.7,0.5,1].choose
        
        sleep 2
        
        control ss,
          mix: 0.33,
          reps: [33, 6 ,11, 44].choose,
          amp: [5, 2, 1, 3, 0].choose,
          cutoff: cutoffs.tick
        
        sleep 1
        
        control ss,
          mix: 0.99,
          reps: 20,
          amp: [10, 0].choose,
          cutoff: 0.25
        
      end
    end
  end
  
  sleep 1
  
end













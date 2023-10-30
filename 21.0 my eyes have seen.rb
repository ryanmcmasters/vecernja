# večernja
# R.McMASTERS
# 21.0 'my eyes have seen...'

use_bpm 55
use_synth :piano

p = [:c4, :bb4, :g4, :eb4, :db4, :a4, :fs4, :g3, :cs4, :cs4,:cs4, :d4, :g4]
pr = [1,1,1,1,1,1,1,1,0.3333,0.3333,0.3333,1,1]

$a = 0

with_fx :reverb, room: 1 do
  
  live_loop :eyes1 do
    t = 1
    i = rrand_i(0,12)
    rrand_i(1,p.size-i).times do
      play p[i], pan: 1, amp: 0.75, attack: $a
      sleep pr[i]*t
      i = i + 1
    end
    sleep 2*t
  end
  
  live_loop :eyes2 do
    t = 1
    i = rrand_i(0,12)
    rrand_i(1,p.size-i).times do
      play p[i], pan: -1, amp: 0.75, attack: $a
      sleep pr[i]*t
      i = i + 1
    end
    sleep 2*t
  end
  
  live_loop :eyes3 do
    t = 1.5
    i = rrand_i(0,12)
    rrand_i(1,p.size-i).times do
      play p[i], pan: -0.25, amp: 0.75, attack: $a
      sleep pr[i]*t
      i = i + 1
    end
    sleep 2*t
  end
  
  live_loop :eyes4 do
    t = 2.5
    i = rrand_i(0,12)
    rrand_i(1,p.size-i).times do
      play p[i], pan: 0.25, amp: 0.75, attack: $a
      sleep pr[i]*t
      i = i + 1
    end
    sleep 2*t
  end
  
  live_loop :eyes5 do
    t = 2
    i = rrand_i(0,12)
    rrand_i(1,p.size-i).times do
      play p[i] - 12, pan: 0, amp: 0.75, attack: $a
      sleep pr[i]*t
      i = i + 1
    end
    sleep 2*t
  end
end

live_loop :bell do
  use_synth :beep
  n = p.choose
  play [n+36, n+48], release: 5, amp: 0.7
  sleep 8
end


live_loop :tapan do
  sample :drum_tom_lo_hard
  sample :bd_808
  sleep 1
  sleep 1.0/3
  sample :drum_tom_lo_hard
  sample :bd_808
  sleep 1.0/3*5
end

live_loop :switch do
  2.times do
    sleep 1.0/3
    sample :perc_impact2, amp: 0.5
  end
  2.times do
    sample :perc_impact2, amp: 0.5
    sleep 1.0/3*2
  end
end
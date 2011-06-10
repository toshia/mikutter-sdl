# -*- coding: utf-8 -*-

require_if_exist 'rubygems'
require_if_exist 'sdl'

Module.new do

  if defined? SDL
    SDL.init(SDL::INIT_AUDIO)
    SDL::Mixer.open
    Plugin::create(:sdl).add_event(:play_sound){ |filename, &stop|
      SDL::Mixer.play_music( SDL::Mixer::Music.load(filename), 1 )
      stop.call
    }
  end

end

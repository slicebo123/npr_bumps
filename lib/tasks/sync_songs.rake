desc "Create NPR episodes and sync song data from spotify"
task :get_all_song_data => :environment do
  Rake::Task['sync_songs_from_npr'].invoke
  Rake::Task['sync_song_data_from_spotify'].invoke
end

# Sync episodes/songs using NPR API
desc "Creates episodes from NPR"
task :sync_songs_from_npr => :environment do
  # This will sync just for the current day
  Program.all.each {|program| program.sync_tracks}
end

# Then sync song data for newly updated songs using Spotify API
desc "Updates 'spotify_id' and 'external_ids' for tracks that were created"
task :sync_song_data_from_spotify => :environment do
  newly_created_tracks = Track.where('created_at >= ?', Time.now.beginning_of_day.utc)
  # SpotifyTrackSyncer.batch_sync_tracks(newly_created_tracks)
  newly_created_tracks.each { |track| SpotifyTrackSyncer.sync_track(track) }
end

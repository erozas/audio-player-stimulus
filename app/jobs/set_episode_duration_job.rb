class SetEpisodeDurationJob < ApplicationJob
  queue_as :default

  def perform
    episodes_without_duration = Episode.where(duration: nil).where.not(audio_attachment: nil)
    
    episodes_without_duration.find_each do |episode|
      next unless episode.audio.attached?
      
      blob = episode.audio.blob

      analyzer = ActiveStorage::Analyzer::AudioAnalyzer.new(blob)
      metadata = analyzer.metadata
      
      if metadata && metadata[:duration].present?
        episode.update(duration: metadata[:duration].to_i)
        
        Rails.logger.info "Updated duration for episode #{episode.name} to #{metadata[:duration]} seconds"
      else
        Rails.logger.warn "Could not determine duration for episode #{episode.name}"
      end
    end
  end
end
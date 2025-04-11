import { Controller } from "@hotwired/stimulus"
import { formatTime } from "../lib/time"

export default class extends Controller {
  static targets = ["waveform", "playIcon", "currentTime", "duration", "progressBar", "progressBarFill", "progressHandle"]
  static values = { 
    url: String,
    backgroundColor: String,
    foregroundColor: String,
  }
  
  connect() {
    this.audio = new Audio(this.urlValue)
    this.boundSetInitialTime = this._setInitialTime.bind(this)
    this.audio.addEventListener("loadedmetadata", this.boundSetInitialTime)

    this.boundHandleTimeUpdate = this._handleTimeUpdate.bind(this)
    this.audio.addEventListener("timeupdate", this.boundHandleTimeUpdate)
  }

  disconnect() {
    this.audio.removeEventListener("loadedmetadata", this.boundSetInitialTime)
    this.audio.removeEventListener("timeupdate", this.boundHandleTimeUpdate)
  }

  togglePlay() {
    if (this.audio.paused) {
      this.audio.play()
    } else {
      this.audio.pause()
    }

    this._togglePlayIcon()
  }

  seek(event) {
    const width = this.progressBarTarget.getBoundingClientRect().width;
    const clickPosition = event.clientX - this.progressBarTarget.getBoundingClientRect().left;
    const percentage = clickPosition / width;
    
    this.audio.currentTime = percentage * this.audio.duration;
    this.progressBarFillTarget.style.width = `${percentage * 100}%`;
    this.progressHandleTarget.style.left = `${percentage * 100}%`;
  }

  _togglePlayIcon() {
    this.playIconTarget.classList.toggle('fa-pause')
    this.playIconTarget.classList.toggle('fa-play')
  }

  _setInitialTime() {
    this.durationTarget.textContent = formatTime(this.audio.duration)
    this.currentTimeTarget.textContent = formatTime(this.audio.currentTime)
  }

  _handleTimeUpdate() {
    this.currentTimeTarget.textContent = formatTime(this.audio.currentTime);
    
    // Calculate the percentage of the current time
    const percentage = (this.audio.currentTime / this.audio.duration) * 100;
    
    // Update the width of the progress bar fill
    this.progressBarFillTarget.style.width = `${percentage}%`;
    
    // Update the position of the progress handle relative to the fill
    this.progressHandleTarget.style.left = `${percentage}%`;
  }
}
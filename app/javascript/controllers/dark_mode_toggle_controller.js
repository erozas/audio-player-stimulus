import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggle", "slider", "sunIcon", "moonIcon"]

  connect() {
    // Initialize based on user's saved preference or system preference
    this.updateToggleState(this.isDarkMode)
  }

  toggle() {
    const newState = !this.isDarkMode
    // The error was here - setDarkMode doesn't exist
    this.updateToggleState(newState)
    
    // Save preference to localStorage
    localStorage.setItem("darkMode", newState ? "dark" : "light")
  }

  updateToggleState(isDark) {
    if (isDark) {
      document.documentElement.classList.add('dark')
    } else {
      document.documentElement.classList.remove('dark')
    }
  }

  get isDarkMode() {
    // Check localStorage first
    const savedPreference = localStorage.getItem("darkMode")
    
    if (savedPreference) {
      return savedPreference === "dark"
    }
    
    // Fall back to system preference
    return window.matchMedia('(prefers-color-scheme: dark)').matches
  }
}
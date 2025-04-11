class DarkModeToggleComponent < ViewComponent::Base
  def initialize(dark_mode: false)
    @dark_mode = dark_mode
  end
end


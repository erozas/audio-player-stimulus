# frozen_string_literal: true

class AudioPlayerComponent < ViewComponent::Base
  def initialize(url:, title: "Untitled audio", author: "Unknown author", background_color: "#ffffff", foreground_color: "#000000")
    @url = url
    @title = title
    @author = author
    @background_color = background_color
    @foreground_color = foreground_color
  end

  def container_classes
    ClassVariants.build(
      base: "w-full gap-2 bg-white dark:bg-slate-800 border border-slate-300 dark:border-slate-700 rounded-lg py-6 px-8",
    ).render
  end

  def track_info_container_classes
    ClassVariants.build(
      base: "flex flex-col items-center justify-center gap-x-2 mb-3",
    ).render
  end
  
  def track_title_classes
    ClassVariants.build(
      base: "text-lg font-bold text-slate-800 dark:text-slate-200",
    ).render
  end

  def track_author_classes
    ClassVariants.build(
      base: "text-sm text-slate-500 dark:text-slate-200",
    ).render
  end

  def progress_bar_container_classes
    ClassVariants.build(
      base: "flex items-center justify-between gap-x-2",
    ).render
  end

  def time_classes
    ClassVariants.build(
      base: "text-sm text-slate-800 dark:text-slate-200",
    ).render
  end

  def progress_bar_classes
    ClassVariants.build(
      base: "flex-grow h-3 bg-slate-200 dark:bg-slate-700 rounded-md overflow-hidden",
    ).render
  end
  
  def progress_bar_fill_classes
    ClassVariants.build(
      base: "h-full bg-slate-800 dark:bg-slate-200 animate-progress relative",
    ).render
  end

  def controls_container_classes
    ClassVariants.build(
      base: "flex items-center gap-x-3 justify-center mt-4",
    ).render
  end

  def play_button_classes
    ClassVariants.build(
      base: "w-10 h-10 rounded-full bg-slate-800 dark:bg-slate-200",
    ).render
  end

  def play_button_icon_classes
    ClassVariants.build(
      base: "text-white dark:text-slate-800",
    ).render
  end

  def secondary_button_classes
    ClassVariants.build(
      base: "w-6 h-6 rounded-full",
    ).render
  end

  def secondary_button_icon_classes
    ClassVariants.build(
      base: "text-slate-800 dark:text-slate-200",
    ).render
  end
end

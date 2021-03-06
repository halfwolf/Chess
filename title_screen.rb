require 'colorize'
require_relative 'cursor'

class TitleScreen

  attr_reader :options, :cursor, :message_hash, :title

  def initialize(cursor = Cursor.new(1,5))
    @cursor = cursor
    @options = [[:start], [:save], [:load], [:return], [:exit]]
                  #it has to be this way for cursor
    @message_hash = { :start => "START NEW GAME",
                      :save => "SAVE",
                      :load => "LOAD SAVED GAME",
                      :return => "RETURN TO GAME",
                      :exit => "QUIT" }
  end

  def title
    "CHESS"
  end

  def current_option
    self.options[self.cursor.row][0]
  end

  def render
    str = self.title << "\n\n"
    syms_arr = self.options.flatten
    syms_arr.each_with_index do |sym, i|
      if i == self.cursor.row
        str << message_hash[sym].colorize(:light_black)
      else
        str << message_hash[sym]
      end
      str << "\n"
    end
    str
  end

  def display
    puts render
  end

end
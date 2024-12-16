# A mixin for aquatic creatures.
#
module Aquatic
  # Swim in the water.
  #
  # @return [void]
  def swim
    puts "swimming in the water"
  end
end

# The base class for all fish.
class Fish
  # Make a sound.
  #
  # @yield [sound] The sound produced by the fish
  # @yieldparam sound [String] The actual sound
  # @return [void]
  def make_sound
    puts "generic bubbling"
    yield "blub"
    yield "blub"
  end

  # Swim in a specific direction.
  #
  # Swimming is the most critical feature of fish.
  #
  # @param direction [Symbol, String] The direction to swim
  # @param speed [Integer] The speed at which to swim
  # @return [Boolean] Whether the swim was successful
  #
  # @example
  #   swim(:north, 30)
  def swim(direction, speed)
    _swim_impl(direction, speed)
  end

  private

  # @!visibility private
  def _swim_impl(direction, speed)
    puts "swimming away: direction=#{direction}, speed=#{speed}"
  end
end

# A salmon is an Aquatic Fish.
#
# ## Features
#
# - **Fish**
#   - make_sound
#   - swim
# - **Aquatic**
#   - swim (overridden)
class Salmon < Fish
  include Aquatic

  # @!group Fish overrides

  # Salmon overrides generic implementation.
  #
  # @yield [sound] The sound produced by the salmon
  # @yieldparam sound [String] The actual sound
  # @return [void]
  def make_sound
    sound = splash
    yield sound
  end

  # Implements splashing
  #
  # @return [String] The splash sound
  def splash
    "splash"
  end

  private :splash

  # @!endgroup

  # @!group Salmon specific attributes

  # @return [Boolean] True for farmed salmon
  attr_accessor :farmed

  # @return [Boolean] True for wild salmon
  attr_reader :wild

  # @return [Integer] Maximum speed for a swimming salmon
  MAX_SPEED = 40

  # @!endgroup

  # Global list of all wild salmon.
  #
  # Use for conservation efforts.
  @@wild_salmon = []

  # @return [Array<Salmon>] List of all wild salmon
  def self.wild_salmon
    @@wild_salmon
  end

  # Creates a new salmon.
  #
  # @param farmed [Boolean] Whether the salmon is farmed
  # @param wild [Boolean] Whether the salmon is wild
  def initialize(farmed, wild)
    @farmed = farmed
    @wild = wild
    @@wild_salmon << self if wild
  end

  # Checks if this salmon is sustainable.
  #
  # @return [Boolean] Whether the salmon is sustainable
  def sustainable?
    @wild || (@farmed && environmentally_friendly?)
  end

  private

  # @return [Boolean] Whether farming practices are environmentally friendly
  def environmentally_friendly?
    # Implementation details...
    true
  end
end

# Default speed for a swimming salmon
DEFAULT_SALMON_SPEED = 20

#   Maximum depth for salmon habitat
MAX_DEPTH = 500

# Default wild salmon.
#
# @note Global variables should be used sparingly, but this is for demonstration.
$default_wild_salmon = Salmon.new(false, true)

# Farmed sustainable salmon.
#
# @note This is just a local variable for demonstration purposes.
farmed_sustainable_salmon = Salmon.new(true, false)

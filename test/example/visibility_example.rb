# frozen_string_literal: true

class VisibilityExample
  # Public method.
  def public_api
    true
  end

  protected

  # Protected method.
  def protected_api
    true
  end

  private

  # Private method.
  def private_api
    true
  end

  # @private
  # Internal private method that should be hidden with --no-private.
  def private_tagged_api
    true
  end

  # @private
  # Constant hidden by --no-private.
  INTERNAL_TOKEN = 'secret'
end
